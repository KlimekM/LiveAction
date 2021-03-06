require 'spec_helper'

describe CheckinsController do
  include SessionsHelper

  describe "GET #index" do
    context "when a place exists" do
      let(:place) { FactoryGirl.create :place }
      it "assigns @place as the correct instance of Place" do
        get :index, place_id: place.id
        expect(assigns(:place).id).to eq(place.id)
      end

      it "assigns @checkins to the appropriate places' checkins" do
        checkins = FactoryGirl.create_list(:checkin, 3, place_id: place.id)
        get :index, place_id: place.id
        expect(assigns(:checkins).length).to eq(3)
      end
    end

    context "when a place does not exist" do
      it "assigns 'The place that you requested does not exist.' as a flash[:notice]" do
        get :index, place_id: Faker::Number.number(5)
        expect(flash[:notice]).to eq("Place not found.")
      end
    end
  end

  describe "GET #new" do
    context "when a place exists" do
      let(:place) { FactoryGirl.create :place }
      it "assigns @place as the correct instance of Place" do
        get :new, place_id: place.id
        expect(assigns(:place).id).to eq(place.id)
      end

      it "assigns @checkin as an instance of Checkin" do
        get :new, place_id: place.id
        expect(assigns(:checkin)).to be_a(Checkin)
      end
    end

    context "when a place does not exist" do
      it "assigns 'The place that you requested does not exist.' as a flash[:notice]" do
        get :new, place_id: Faker::Number.number(5)
        expect(flash[:notice]).to eq("Place not found.")
      end
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do
      let(:place) { FactoryGirl.create :place }
      let(:user) { FactoryGirl.create :user }
      let(:checkin) { FactoryGirl.build :checkin, place_id: place.id, user_id: user.id }
      it "assigns @place to the correct instance of Place" do
        simulate_login
        post :create, place_id: place.id, checkin: { description: checkin.description, place_id: checkin.place_id, "date_attended(1i)"=>"2015", "date_attended(2i)"=>"5", "date_attended(3i)"=>"3" }
        expect(assigns(:place).id).to eq(place.id)
      end

      it "adds a checkin to @user.checkins" do
        simulate_login
        post :create, place_id: place.id, checkin: { description: checkin.description, place_id: checkin.place_id, "date_attended(1i)"=>"2015", "date_attended(2i)"=>"5", "date_attended(3i)"=>"3" }
        expect(assigns(:user).checkins.count).to eq(user.checkins.count)
      end

      it "renders the checkins index page when the checkin saves" do
        simulate_login
        post :create, place_id: place.id, checkin: { description: checkin.description, place_id: checkin.place_id, "date_attended(1i)"=>"2015", "date_attended(2i)"=>"5", "date_attended(3i)"=>"3" }
        expect(response).to render_template(:index)
      end
    end

    context "when invalid params are passed" do
      let(:place) { FactoryGirl.create :place }
      let(:user) { FactoryGirl.create :user }
      let(:checkin) { FactoryGirl.build :checkin, place_id: place.id, user_id: user.id }
      it "re-renders the new checkin template" do
        simulate_login
        post :create, place_id: place.id, checkin: { description: checkin.description, place_id: checkin.place_id, "date_attended(1i)"=>"2050", "date_attended(2i)"=>"5", "date_attended(3i)"=>"3" }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #edit" do
    let(:place) { FactoryGirl.create :place }
    let(:user) { FactoryGirl.create :user }
    let(:checkin) { FactoryGirl.create :checkin, place_id: place.id, user_id: user.id }
    context "when the logged in user is the creator of the checkin and the checkin place id is equal to the place id" do
      it "assigns place and checkin as the correct instance of each model" do
        simulate_login
        get :edit, place_id: place.id, id: checkin.id
        expect(assigns(:place).id).to eq(place.id)
        expect(assigns(:checkin).id).to eq(checkin.id)
      end

      it "verifies that a user is logged in and that the current_user id is equal to the checkin creator id" do
        simulate_login
        get :edit, place_id: place.id, id: checkin.id
        expect(current_user.id).to eq(checkin.user.id)
      end

      it "verifies that the checkin.place.id is equal to @place.id" do
        simulate_login
        get :edit, place_id: place.id, id: checkin.id
        expect(assigns(:place).id).to eq(checkin.place.id)
      end

      it "renders the edit template" do
        simulate_login
        get :edit, place_id: place.id, id: checkin.id
        expect(response).to render_template(:edit)
      end
    end

    context "when a user is not the creator of the checkin, is not logged in, or the checkin place id is not equal to the place id" do
      it "assigns 'Not authorized to edit this checkin.' as a flash[:notice]" do
        get :edit, place_id: place.id, id: checkin.id
        expect(flash[:notice]).to eq("Not authorized to edit this checkin.")
      end

      it "redirects to the places index route" do
        get :edit, place_id: place.id, id: checkin.id
        expect(response).to redirect_to("/places")
      end
    end
  end

  describe "PUT #update" do
    let(:place) { FactoryGirl.create :place }
    let(:user) { FactoryGirl.create :user }
    let(:checkin) { FactoryGirl.create :checkin, place_id: place.id, user_id: user.id }
    context "when valid params are passed" do
      it "assigns @place and @checkin as the correct instance of each model" do
        new_description = Faker::Lorem.sentence
        get :edit, place_id: place.id, id: checkin.id
        put :update, place_id: checkin.place.id, id: checkin.id, checkin: { description: new_description, place_id: checkin.place_id, "date_attended(1i)"=>"2016", "date_attended(2i)"=>"5", "date_attended(3i)"=>"30" }
        expect(assigns(:place).id).to eq(place.id)
        expect(assigns(:checkin).id).to eq(checkin.id)
      end

      it "changes the description of the checkin to new_description" do
        new_description = Faker::Lorem.sentence
        get :edit, place_id: place.id, id: checkin.id
        put :update, place_id: checkin.place.id, id: checkin.id, checkin: { description: new_description, place_id: checkin.place_id, "date_attended(1i)"=>"2016", "date_attended(2i)"=>"5", "date_attended(3i)"=>"30" }
        expect(assigns(:checkin).description).to eq(new_description)
      end

      it "redirects to the appropriate checkin" do
        new_description = Faker::Lorem.sentence
        get :edit, place_id: place.id, id: checkin.id
        put :update, place_id: checkin.place.id, id: checkin.id, checkin: { description: new_description, place_id: checkin.place_id, "date_attended(1i)"=>"2016", "date_attended(2i)"=>"5", "date_attended(3i)"=>"30" }
        expect(response).to redirect_to([place, checkin])
      end
    end

    context "when invalid params are passed" do
      it "assigns 'The checkin date can not be in the future as a flash[:notice]'" do
        new_description = Faker::Lorem.sentence
        get :edit, place_id: place.id, id: checkin.id
        put :update, place_id: checkin.place.id, id: checkin.id, checkin: { description: new_description, place_id: checkin.place_id, "date_attended(1i)"=>"2050", "date_attended(2i)"=>"5", "date_attended(3i)"=>"30" }
        expect(flash[:notice]).to eq("The checkin date can not be in the future.")
      end

      it "re-renders the edit page" do
        new_description = Faker::Lorem.sentence
        get :edit, place_id: place.id, id: checkin.id
        put :update, place_id: checkin.place.id, id: checkin.id, checkin: { description: new_description, place_id: checkin.place_id, "date_attended(1i)"=>"2050", "date_attended(2i)"=>"5", "date_attended(3i)"=>"30" }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "GET #show" do
    context "when a place and checkin exist" do
      let(:place) { FactoryGirl.create :place }
      let(:user) { FactoryGirl.create :user }
      let(:checkin) { FactoryGirl.create :checkin, place_id: place.id, user_id: user.id }
      it "assigns @place, @checkin, and @user to the correct place, checkin, and user" do
        get :show, place_id: checkin.place.id, id: checkin.id
        expect(assigns(:place).address).to eq(place.address)
        expect(assigns(:checkin).description).to eq(checkin.description)
        expect(assigns(:user).id).to eq(checkin.user_id)
      end

      it "verifies that the place id is equal to the checkin place id and renders the show template" do
        get :show, place_id: checkin.place.id, id: checkin.id
        expect(assigns(:place).id).to eq(checkin.place.id)
        expect(response).to render_template(:show)
      end
    end

    context "when a checkin does not exist or the place id is not equal to the checkin place id" do
      let(:place) { FactoryGirl.create :place }
      let(:checkin) { FactoryGirl.create :checkin }
      let(:user) { FactoryGirl.create :user, id: checkin.user_id }
      it "assigns 'Checkin not found.' as a flash[:notice]" do
        get :show, place_id: checkin.place.id, id: Faker::Number.number(5)
        expect(flash[:notice]).to eq("Checkin not found.")
      end

      it "redirects to the places index page" do
        get :show, place_id: checkin.place.id, id: Faker::Number.number(5)
        expect(response).to redirect_to("/places")
      end
    end
  end

  describe "DELETE #destroy" do
    let(:place) { FactoryGirl.create :place }
    let(:user) { FactoryGirl.create :user }
    let(:checkin) { FactoryGirl.build :checkin, place_id: place.id, user_id: user.id }
    it "finds and deletes the correct instance of Checkin" do
      simulate_login
      post :create, place_id: place.id, checkin: { description: checkin.description, place_id: checkin.place_id, "date_attended(1i)"=>"2015", "date_attended(2i)"=>"5", "date_attended(3i)"=>"3" }
      delete :destroy, id: Checkin.last.id, place_id: place.id
      expect(Checkin.find_by(id: checkin.id)).to be nil
    end

    it "redirects to the correct place" do
      simulate_login
      post :create, place_id: checkin.place.id, checkin: { description: checkin.description, place_id: checkin.place_id, "date_attended(1i)"=>"2015", "date_attended(2i)"=>"5", "date_attended(3i)"=>"3" }
      delete :destroy, id: Checkin.last.id, place_id: place.id
      expect(response).to redirect_to("/places/#{place.id}/checkins")
    end
  end
end
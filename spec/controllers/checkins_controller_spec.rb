require 'spec_helper'

describe CheckinsController do
  describe "GET #index" do
    context "when a place exists" do
      let!(:place) { FactoryGirl.create :place }
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
        expect(flash[:notice]).to eq("The place that you requested does not exist.")
      end
    end
  end

  describe "GET #new" do
    context "when a place exists" do
      let!(:place) { FactoryGirl.create :place }
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
        expect(flash[:notice]).to eq("The place that you requested does not exist.")
      end
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do
      let!(:place) { FactoryGirl.create :place }
      let!(:user) { FactoryGirl.create :user }
      let!(:checkin) { FactoryGirl.build :checkin, place_id: place.id, user_id: user.id }
      it "assigns @place to the correct instance of Place" do
        post :create, place_id: place.id, checkin: { description: checkin.description, place_id: checkin.place_id, date_attended: "PICK IT UP HERE" }
        expect(assigns(:place).id).to eq(place.id)
      end
    end
  end
end
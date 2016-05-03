require 'spec_helper'

describe PlacesController do
  describe "GET #index" do
    it "properly assigns all of the places to @places" do
      places = FactoryGirl.create_list(:place, 3)
      get :index
      expect(assigns(:places).length).to eq(3)
    end
  end

  describe "GET #show" do
    context "when a place exists" do
      let!(:place) { FactoryGirl.create :place }
      it "assigns @place as an instance of Place" do
        get :show, id: place.id
        expect(assigns(:place)).to be_a(Place)
      end

      it "ensures @place has the correct id" do
        get :show, id: place.id
        expect(assigns(:place).id).to eq(place.id)
      end
    end

    context "when a place does not exist" do
      it "assigns 'The place that you requested does not exist.' as a flash[:notice]" do
        get :show, id: Faker::Number.number(5)
        expect(flash[:notice]).to eq("The place that you requested does not exist.")
      end
    end
  end
end
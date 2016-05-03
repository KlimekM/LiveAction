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
        get :index, place_id: place.id
        expect(assigns(:checkins).length).to eq(1)
      end
    end

    context "when a place does not exist" do
    end
  end
end
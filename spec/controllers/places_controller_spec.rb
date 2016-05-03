require 'spec_helper'

describe PlacesController do
  describe "GET #index" do
    it "properly assigns all of the places to @places" do
      places = FactoryGirl.create_list(:place, 3)
      get :index
      expect(assigns(:places).length).to eq(3)
    end
  end
end
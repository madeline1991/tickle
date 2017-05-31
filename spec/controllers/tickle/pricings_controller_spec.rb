require 'rails_helper'

module Tickle
  RSpec.describe PricingsController, type: :controller do
    routes { Tickle::Engine.routes }
    describe "GET #index" do
      it "renders the pricings index" do
        get :index
        expect(response).to be_success
        expect(response).to render_template(:index)
      end
    end
    describe "POST #create" do
      context "if age and gender are provided by user" do
        it "renders the pricings create" do
          post :create
          expect(response).to be_success
        end
      end

      context "if age and gender are not given by user" do
        it "redirect to pricings index"
      end

      context "if age is not given by user" do
        it "redirect to pricings index"
      end

      context "if gender is not given by user" do
        it "redirect to pricings index"
      end
    end
  end
end

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
          post :create, params: { pricings: { age: 18, gender: "Female" } }
          expect(response).to render_template(:create)
        end
      end

      context "if age and gender are not given by user" do
        it "redirect to pricings index" do
          post :create, params: { pricings: { age: "" } }
          expect(response).to redirect_to(pricings_url)
        end
      end

      context "if age is not given by user" do
        it "redirect to pricings index" do
          post :create, params: { pricings: { age: "", gender: "Male" } }
          expect(response).to redirect_to(pricings_url)
        end
      end

      context "if gender is not given by user" do
        it "redirect to pricings index" do
          post :create, params: { pricings: { age: 35 } }
          expect(response).to redirect_to(pricings_url)
        end
      end
    end
  end
end

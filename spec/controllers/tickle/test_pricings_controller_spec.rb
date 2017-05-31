require 'rails_helper'

module Tickle
  RSpec.describe TestPricingsController, type: :controller do
    describe "GET #index" do
      it "renders the pricings index"
    end
    describe "POST #create" do
      context "if age and gender are provided by user" do
        it "renders the pricings create"
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

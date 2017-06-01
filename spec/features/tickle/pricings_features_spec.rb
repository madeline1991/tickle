
require 'rails_helper'

module Tickle
  feature "quote features", type: :feature do
    feature "making a new price quote" do
      before(:each) do
        visit "/tickle/pricings/new"
      end

      context "with valid params" do
        scenario "for a female with no conditions" do
          fill_in "Age", with: "18"
          choose "Female"
          click_on "Get a free quote"
          expect(page).to have_content("$88")
        end

        scenario "for a female with no conditions and age between 23 and 28" do
          fill_in "Age", with: "25"
          choose "Female"
          click_on "Get a free quote"
          expect(page).to have_content("$108")
        end

        scenario "for a male with a condition" do
          fill_in "Age", with: "18"
          choose "Male"
          check "Heart Disease"
          click_on "Get a free quote"
          expect(page).to have_content("$117")
        end
      end

      context "with invalid params" do
        scenario "for a user that does not provide an age" do
          choose "Male"
          click_on "Get a free quote"
          expect(page).to have_content("You must provide an age to get a quote")
        end

        scenario "for a user whose age is under 18" do
          fill_in "Age", with: "17"
          choose "Male"
          click_on "Get a free quote"
          expect(page).to have_content("You can only get a quote if you are 18 or over")
        end

        scenario "for a user who inputs an invalid age" do
          fill_in "Age", with: "130"
          choose "Male"
          click_on "Get a free quote"
          expect(page).to have_content("Age must be a valid age")
        end

        scenario "for a user who doesn't choose a gender" do
          fill_in "Age", with: "30"
          click_on "Get a free quote"
          expect(page).to have_content("You must select a gender")
        end

        scenario "for a user who doesn't provide an age or select a gender" do
          click_on "Get a free quote"
          expect(page).to have_content("You must provide an age to get a quote")
          expect(page).to have_content("You must select a gender")
        end
      end
    end
  end
end

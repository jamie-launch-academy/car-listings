require "rails_helper"

feature "User adds a new car listing", %q(
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot

  Acceptance Criteria:

  [ ] I must specify the manufacturer, color, year, and mileage of the car (an association between the car and an existing manufacturer should be created).
  [ ] Only years from 1920 and above can be specified.
  [ ] I can optionally specify a description of the car.
  [ ] If I enter all of the required information in the required formats, the car is recorded and I am presented with a notification of success.
  [ ] If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors.
  [ ] Upon successfully creating a car, I am redirected back to the index of cars.

  ) do

    scenario "user fills out cars form", focus: true do
      FactoryGirl.create(:manufacturer)
      visit new_car_path

      expect(page).to have_content "Fill out the form below to add a car"
      select "Ford", from: "Manufacturer"
      fill_in "Color", with: "Green"
      select "1993", from: "Year"
      fill_in "Mileage", with: "19324"
      fill_in "Description", with: "The car use to be blue."
      click_button "Submit Car"

      expect(page).to have_content "You have successfully entered a new car listing"
      expect(page).to have_content "Ford"
      expect(page).to have_content "Green"
      expect(page).to have_content "1993"
      expect(page).to have_content "19324"
      expect(page).to have_content "The car use to be blue."
    end

    scenario "user enters incorrect information for car listing" do
      visit root_path
      click_link "View Cars"
      click_link "Add New Car"

      expect(page).to have_content "Fill out the form below to add a car"
      select "Ford", from: "Manufacturer_id"
      fill_in "color", with: ""
      select "1993", from: "Year"
      fill_in "mileage", with: "W"
      fill_in "description", with: ""
      click_button "Submit Car"

      expect(page).to have_content "Color cannot be blank"
      expect(page).to have_content "Mileage must be numerical"
    end
end

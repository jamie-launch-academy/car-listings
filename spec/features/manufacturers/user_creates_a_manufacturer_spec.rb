require "rails_helper"

feature "A user saves a manufacturers information", %q(
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot

  Acceptance Criteria:

  [x] I must specify a manufacturer name and country.
  [x] If I do not specify the required information, I am presented with errors.
  [x] If I specify the required information, the manufacturer is recorded and I am redirected to the index of manufacturers
) do

  scenario "user successfully adds manufacturer information" do
    visit new_manufacturer_path

    expect(page).to have_content "Fill out the form below to add a manufacturer"
    fill_in "Name", with: "Ford"
    fill_in "Country", with: "USA"
    click_button "Submit Manufacturer"

    expect(page).to have_content "Your manufacturer has been successfully added."
    expect(page).to have_content "Ford"
    expect(page).to have_content "USA"
  end

  scenario "user attempts to add blank manufacturer field" do
    visit new_manufacturer_path

    expect(page).to have_content "Fill out the form below to add a manufacturer"
    fill_in "Name", with: "Ford"
    fill_in "Country", with: ""
    click_button "Submit Manufacturer"

    expect(page).to have_content "Country can't be blank"

    visit manufacturers_path
    expect(page).to_not have_content "Ford"
  end

  scenario "user attempts to add duplicate manufacturer name" do
    visit manufacturers_path

    2.times do
      visit new_manufacturer_path
      expect(page).to have_content "Fill out the form below to add a manufacturer"
      fill_in "Name", with: "Ford"
      fill_in "Country", with: "USA"
      click_button "Submit Manufacturer"
    end

    expect(page).to have_content "Manufacturer name has already been used"
  end
end

require 'rails_helper'

feature "A user saves a manufacturers information", %q(
As a car salesperson
I want to record a car manufacturer
So that I can keep track of the types of cars found in the lot

Acceptance Criteria:

[ ] I must specify a manufacturer name and country.
[ ] If I do not specify the required information, I am presented with errors.
[ ] If I specify the required information, the manufacturer is recorded and I am redirected to the index of manufacturers
) do

  scenario "user successfully adds manufacturer information", :focus => true do
    visit root_path
    click_link "View Manufacturers"
    click_link "Add New Manufacturer"

    expect(page).to have_content "Fill out the form below to add a manufacturer"
    fill_in "Name", with: "Ford"
    fill_in "Country", with: "USA"
    click_button "Submit Manufacturer"

    expect(page).to have_content "Your playlist has been successfully added."
    expect(page).to have_content "Ford"
    expect(page).to have_content "USA"
  end

  # scenario "user unsuccessfully adds manufacturer inforamtion" do
  #   visit manufacturer_path
  #   click_link "Add manufacturer"
  #
  #   expect(page).to have_content "Fill out the form below to add a manufacturer"
  #   fill_in "Name", with: "Ford"
  #   fill_in "Country", with: ""
  #   click_button "Submit Manufacturer"
  #
  #   expect(page).to have_content "Country field cannot be blank"
  #
  #   visit manufacturer_path
  #   expect(page).to_not have_content "Ford"
  # end
end

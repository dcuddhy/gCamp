require 'rails_helper'



feature "Users CRUD" do

  scenario "User Create Read Update Destroy" do

    visit users_path
    click_on "New User"
    expect(page).to have_content("New User")

#CRAEATE
    fill_in "First name", with: "Barry"
    fill_in "Last name", with: "White"
    fill_in "Email", with: "barry@white.com"
    fill_in "Password", with: "pass"
    fill_in "Password confirmation", with: "pass"
    click_on "Create User"

    expect(page).to have_content("Barry White")
      save_and_open_page

#READ
    visit users_path
    expect(page).to have_content("barry@white.com")

#UPDATE
    click_on "Edit"
    fill_in "Last name", with: "Black"
    click_on "Update User"
    expect(page).to have_content("Barry Black")

#DESTROY
    click_on "Edit"
    click_on "Delete"
    expect(page).to have_no_content("Barry White")


  end

end

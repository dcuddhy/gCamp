

#######################################################
##FIX AND ADD _SPEC TO FILE NAME SO THAT TRAVIS FINDS##
#######################################################

require 'rails_helper'



feature "Users CRUD" do

  before do
    User.create!(
    first_name: "Hulk",
    last_name: "Hogan",
    email: "hh@hh.com",
    password: "pass",
    password_confirmation: "pass",
    admin: true
    )
    visit signin_path
    fill_in "Email", with: "hh@hh.com"
    fill_in "Password", with: "pass"
    click_button "Sign in"
  end

  scenario "User creates a user" do

    visit users_path
    click_on "New User"
    expect(page).to have_content("New User")

    fill_in "First name", with: "Barry"
    fill_in "Last name", with: "White"
    fill_in "Email", with: "barry@white.com"
    fill_in "Password", with: "pass"
    fill_in "Password confirmation", with: "pass"
    click_on "Create User"
    expect(page).to have_content("Barry White")

  end


  scenario "User can view a user" do

    visit users_path
    click_on "New User"
    expect(page).to have_content("New User")

    fill_in "First name", with: "Barry"
    fill_in "Last name", with: "White"
    fill_in "Email", with: "barry@white.com"
    fill_in "Password", with: "pass"
    fill_in "Password confirmation", with: "pass"
    click_on "Create User"
    expect(page).to have_content("Barry White")

  end


  scenario "User can update a user" do

    visit users_path
    click_on "New User"
    expect(page).to have_content("New User")

    fill_in "First name", with: "Barry"
    fill_in "Last name", with: "White"
    fill_in "Email", with: "barry@white.com"
    fill_in "Password", with: "pass"
    fill_in "Password confirmation", with: "pass"
    click_on "Create User"
    expect(page).to have_content("Barry White")

    click_on "Barry White"
    click_on "Edit"
    fill_in "Last name", with: "Black"
    click_on "Update User"
    expect(page).to have_content("Barry Black")

  end

  scenario "User can delete a user" do

    visit users_path
    click_on "New User"
    expect(page).to have_content("New User")

    fill_in "First name", with: "Barry"
    fill_in "Last name", with: "White"
    fill_in "Email", with: "barry@white.com"
    fill_in "Password", with: "pass"
    fill_in "Password confirmation", with: "pass"
    click_on "Create User"
    expect(page).to have_content("Barry White")

    click_on "Barry White"
    click_on "Edit"
    click_on "Delete"
    expect(page).to have_content("successfully deleted")
    expect(page).to have_no_content("Barry White")

  end

end

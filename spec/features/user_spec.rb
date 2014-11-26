require 'rails_helper'



feature "Users CRUD" do

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

    click_on "Edit"
    click_on "Delete"
    expect(page).to have_content("Deleted Successfully")

  end

end

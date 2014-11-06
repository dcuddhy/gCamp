require 'rails_helper'



feature "Sign Up Out & In" do

  scenario "User sign out" do



    visit signup_path
    fill_in "First name", with: "Barry"
    fill_in "Last name", with: "White"
    fill_in "Email", with: "barry@white.com"
    fill_in "Password", with: "pass"
    fill_in "Password confirmation", with: "pass"
    click_on "Create User"
      save_and_open_page


    click_on "Sign Out"
    expect(page).to have_content("Sign In")
      save_and_open_page


    visit signin_path
    fill_in "Email", with: "barry@white.com"
    fill_in "Password", with: "pass"
    click_on "Sign in"
      save_and_open_page

    expect(page).to have_content("Barry White")



  end

end

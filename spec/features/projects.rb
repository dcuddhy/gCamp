require 'rails_helper'

feature "Projects CRUD" do

  scenario "Projects Create Read Update Destroy" do

    visit projects_path
    click_on "Add a Project"
    expect(page).to have_content("Create Project")

#CRAEATE
    fill_in "Name", with: "Skeg"
    click_on "Create Project"

    expect(page).to have_content("Skeg")

# #READ
    expect(page).to have_content("Skeg")

# #UPDATE
    click_on "Edit"
    fill_in "Name", with: "Fin"
    click_on "Update Project"
    expect(page).to have_content("Fin")

# #DESTROY
    click_on "Destroy"
    expect(page).to have_no_content("Fin")

  end

end

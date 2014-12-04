

#######################################################
##FIX AND ADD _SPEC TO FILE NAME SO THAT TRAVIS FINDS##
#######################################################

require 'rails_helper'

feature "Projects CRUD" do


  scenario "User can add a project" do

    visit projects_path
    click_on "Add a Project"
    expect(page).to have_content("Create Project")

    fill_in "Name", with: "Skeg"
    click_on "Create Project"
    expect(page).to have_content("Skeg")

  end


  scenario "User can read a project" do

    visit projects_path
    click_on "Add a Project"
    expect(page).to have_content("Create Project")

    fill_in "Name", with: "Skeg"
    click_on "Create Project"
    expect(page).to have_content("Skeg")

  end


  scenario "Projects Create Read Update Destroy" do

    visit projects_path
    click_on "Add a Project"
    expect(page).to have_content("Create Project")

    fill_in "Name", with: "Skeg"
    click_on "Create Project"
    expect(page).to have_content("Skeg")

    click_on "Edit"
    fill_in "Name", with: "Fin"
    click_on "Update Project"
    expect(page).to have_content("Fin")

  end


  scenario "Projects Create Read Update Destroy" do

    visit projects_path
    click_on "Add a Project"
    expect(page).to have_content("Create Project")

    fill_in "Name", with: "Skeg"
    click_on "Create Project"
    expect(page).to have_content("Skeg")

    click_on "Edit"
    fill_in "Name", with: "Fin"
    click_on "Update Project"
    expect(page).to have_content("Fin")

    click_on "Destroy"
    expect(page).to have_no_content("Fin")

  end

end
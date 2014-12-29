

#######################################################
##FIX AND ADD _SPEC TO FILE NAME SO THAT TRAVIS FINDS##
#######################################################


require 'rails_helper'



feature "Tasks CRUD" do


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

  scenario "User can create a task" do

    visit projects_path
    click_on "Add a Project"
    expect(page).to have_content("Create Project")

    fill_in "Name", with: "Origami Crane"
    click_on "Create Project"
    expect(page).to have_content("Origami Crane")

    click_on "0 tasks"
    expect(page).to have_content("Tasks for")

    click_on "New Task"
    fill_in "Description", with: "Sushi"
    fill_in "Due Date", with: "11/11/3014"
    click_on "Create Task"
    expect(page).to have_content("Sushi")

  end


  scenario "User can see a task show page" do

    visit projects_path
    click_on "Add a Project"
    expect(page).to have_content("Create Project")

    fill_in "Name", with: "Origami Crane"
    click_on "Create Project"
    expect(page).to have_content("Origami Crane")

    click_on "0 tasks"
    expect(page).to have_content("Tasks for")

    click_on "New Task"
    fill_in "Description", with: "Sushi"
    fill_in "Due Date", with: "11/11/3014"
    click_on "Create Task"
    expect(page).to have_content("Sushi")

  end


  scenario "User can update a task" do

    visit projects_path
    click_on "Add a Project"
    expect(page).to have_content("Create Project")

    fill_in "Name", with: "Origami Crane"
    click_on "Create Project"
    expect(page).to have_content("Origami Crane")

    click_on "0 tasks"
    expect(page).to have_content("Tasks for")

    click_on "New Task"
    fill_in "Description", with: "Sushi"
    fill_in "Due Date", with: "11/11/3014"
    click_on "Create Task"
    expect(page).to have_content("Sushi")

    click_on "Edit"
    fill_in "Description", with: "Sushimi"
    fill_in "Due Date", with: "11/11/3014"
    click_on "Update Task"
    expect(page).to have_content("Sushimi")

  end

  scenario "user can destroy a task" do

    visit projects_path
    click_on "Add a Project"
    expect(page).to have_content("Create Project")

    fill_in "Name", with: "Origami Crane"
    click_on "Create Project"
    expect(page).to have_content("Origami Crane")

    click_on "0 tasks"
    expect(page).to have_content("Tasks for")

    click_on "New Task"
    fill_in "Description", with: "Sushi"
    fill_in "Due Date", with: "11/11/3014"
    click_on "Create Task"
    expect(page).to have_content("Sushi")

    click_link "glyphicon-find-me"
    expect(page).to have_content("successfully destroyed")

  end

end

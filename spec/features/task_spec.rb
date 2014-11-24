require 'rails_helper'



feature "Tasks CRUD" do

  scenario "Task CREATE" do

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


  scenario "Task READ" do

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


  scenario "Task UPDATE" do

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

  scenario "Task DESTROY" do

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

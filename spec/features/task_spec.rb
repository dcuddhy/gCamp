require 'rails_helper'



feature "Tasks CRUD" do

  scenario "Task CREATE" do

    visit project_tasks_path(@project)
    click_on "New Task"
    expect(page).to have_content("New Task")

    fill_in "Description", with: "Sushi"
    fill_in "Due Date", with: "11/11/2014"
    click_on "Create Task"

    expect(page).to have_content("Sushi")
  end


  scenario "Task READ" do

    visit project_tasks_path(@project)
    click_on "New Task"
    expect(page).to have_content("New Task")

    fill_in "Description", with: "Sushi"
    fill_in "Due Date", with: "11/11/2014"
    click_on "Create Task"

    expect(page).to have_content("Sushi")

  end

  
#UPDATE
    click_on "Edit"
    fill_in "Description", with: "Nigiri"
    check 'Complete'
    click_on "Update Task"
    expect(page).to have_content("true")

#DESTROY
    visit project_tasks_path(@project)
    click_on "Destroy"
    expect(page).to have_no_content("Nigiri")


  end

end

require "rails_helper.rb"

  describe "tasks" do

  it "validates presence of task description" do
    task = Task.new(description:"MY TASK")
    task.valid?
    expect(task.errors[:description].present?).to eq(false)
  end

  it "validates lack of task description" do
    task = Task.new(description:"")
    task.valid?
    expect(task.errors[:description].present?).to eq(true)
  end

  it "validates presence of task future due date" do
    task = Task.new(description:"MY TASK", due_date:"12/12/3014")
    task.valid?
    expect(task.errors[:due_date].present?).to eq(false)
  end

  it "validates presence of task future due date" do
    task = Task.new(description:"MY TASK", due_date:"12/12/1014")
    task.valid?
    expect(task.errors[:due_date].present?).to eq(true)
  end

end

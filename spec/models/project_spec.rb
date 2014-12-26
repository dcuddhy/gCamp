require "rails_helper.rb"

  describe "projects" do

    it "validates lack of project" do
      project = Project.new
      project.valid?
      expect(project.errors[:name].present?).to eq(true)
    end

    it "validates presence of project" do
      project = Project.new(name:"burritos")
      project.valid?
      expect(project.errors[:name].present?).to eq(false)
    end

    it "validates uniqueness of project" do
      project = Project.create(name:"burritos")
      project = Project.new(name:"burritos")
      project.valid?
      expect(project.errors[:name].present?).to eq(true)
    end

    it "validates uniqueness of project" do
      project = Project.create(name:"burritos")
      project = Project.new(name:"burritos")
      project.valid?
      expect(project.errors[:name].present?).to eq(true)
    end

end

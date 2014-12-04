require 'rails_helper'

describe TasksController do

  describe "#index" do

    before do
      @project = Project.create!(name: "Acme")
      @user = User.create!(
      first_name: "Joe",
      last_name: "Example",
      password: "password",
      email: "joe@example.com"
      )
    end

    it "shows tasks to project members" do
      Membership.create!(user: @user, project: @project, role: 'member')
      session[:user_id] = @user.id

      get :index, project_id: @project.id

      expect(response).to be_success
    end

  end

end

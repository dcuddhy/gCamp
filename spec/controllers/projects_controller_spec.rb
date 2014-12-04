require 'rails_helper'

describe ProjectsController do

  describe "#destroy" do

    before do
      @user = User.create!(
      first_name: "Joe",
      last_name: "Example",
      password: "password",
      email: "joe@example.com"
      )
      @project = Project.create!(
      name: "Acme"
      )
    end

    it "does not allow non-members" do
      session[:user_id] = @user.id
      count = Project.count

      delete :destroy, id: @project.id

      expect(count).to eq(Project.count)
      expect(response.status).to eq(404)
    end

    it "does not allow project members" do
      Membership.create!(
      user: @user,
      project: @project,
      role: 'member'
      )
      session[:user_id] = @user.id
      count = Project.count

      delete :destroy, id: @project.id

      expect(count).to eq(Project.count)
      expect(response.status).to eq(404)
    end

    it "allows owners to delete" do
      Membership.create!(
      user: @user,
      project: @project,
      role: 'owner'
      )
      session[:user_id] = @user.id
      count = Project.count

      delete :destroy, id: @project.id

      expect(Project.count).to eq(count - 1)
      expect(response).to redirect_to(projects_path)
    end

  end

end

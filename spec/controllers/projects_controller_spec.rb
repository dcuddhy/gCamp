require 'rails_helper'

describe ProjectsController do

  before do
    @project = Project.create!(
    name: "Acme"
    )
    @user = User.create!(
    first_name: "Joe",
    last_name: "Example",
    password: "password",
    email: "joe@example.com"
    )
    @member = User.create!(
    first_name: "Jane",
    last_name: "Example",
    password: "password",
    email: "jane@example.com"
    )
    @membership = Membership.create!(
    user_id: @member.id,
    project_id: @project.id,
    role: 'member'
    )
    @owner = User.create!(
    first_name: "Jimmy",
    last_name: "Example",
    password: "password",
    email: "jimmy@example.com"
    )
    @membership = Membership.create!(
    user_id: @owner.id,
    project_id: @project.id,
    role: "owner"
    )
    @admin = User.create!(
    first_name: "Jill",
    last_name: "Example",
    password: "password",
    email: "jill@example.com",
    admin: true
    )

  end

  # ----------------------> #DESTROY <----------------------------

  describe "#destroy" do

    it "does not allow non-members to delete" do
      session[:user_id] = @user.id
      count = Project.count

      delete :destroy, id: @project.id

      expect(count).to eq(Project.count)
      expect(response.status).to eq(404)
    end

    # it "does not allow project members to delete" do
    #   Membership.create!(
    #   user: @user,
    #   project: @project,
    #   role: 'member'
    #   )
    #   session[:user_id] = @user.id
    #   count = Project.count
    #
    #   delete :destroy, id: @project.id
    #
    #   expect(count).to eq(Project.count)
    #   expect(response.status).to eq(404)
    # end

    # it "allows owners to delete" do
    #   Membership.create!(
    #   user: @user,
    #   project: @project,
    #   role: 'owner'
    #   )
    #   session[:user_id] = @user.id
    #   count = Project.count
    #
    #   delete :destroy, id: @project.id
    #
    #   expect(Project.count).to eq(count - 1)
    #   expect(response).to redirect_to(projects_path)
    # end

  end

end

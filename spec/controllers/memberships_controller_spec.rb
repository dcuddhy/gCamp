require 'rails_helper'

describe MembershipsController do

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


  # ----------------------> #INDEX <----------------------------


  # describe "#index" do
  #
  #   it "does not allow visitors to see index" do
  #     session[:user_id] = nil
  #     get :index, project_id: @project
  #     expect(response.status).to redirect_to(signin_path)
  #   end
  #
  #   it "does not allow non-members to see index" do
  #     session[:user_id] = @user
  #     get :index, project_id: @project
  #     expect(response.status).to eq(404)
  #   end
  #
  #   it "allows members to see index" do
  #     session[:user_id] = @member
  #     get :index, project_id: @project
  #     expect(response).to render_template('index')
  #   end
  #
  #   it "allows owners to see index" do
  #     session[:user_id] = @owner
  #     get :index, project_id: @project
  #     expect(response).to render_template('index')
  #   end
  #
  #   it "allows admins to see index" do
  #     session[:user_id] = @admin
  #     get :index, project_id: @project
  #     expect(response).to render_template('index')
  #   end
  #
  # end


  # ----------------------> #CREATE <----------------------------


  describe "#create" do

    # it "does not allow visitors to create" do
    #   session[:user_id] = nil
    #   post :create, project_id: @project
    #   expect(response.status).to redirect_to(signin_path)
    # end

    it "does not allow non-members to create" do
      session[:user_id] = @user
      post :create, project_id: @project, id: @user
      expect(response.status).to eq(404)
    end

    it "does not allow members to create create" do
      session[:user_id] = @member
      post :create, project_id: @project, id: @user
      expect(response.status).to eq(404)
    end

    it "allows admins to create" do
      session[:user_id] = @admin
      post :create, project_id: @project, :membership =>
      {project_id: @project, user_id: @user, role: 'member'}
      expect(response).to redirect_to(project_memberships_path(@project))
    end

  end


  # ----------------------> #UPDATE <----------------------------


  describe "#update" do

    it "does not allow non-members to update" do
      session[:user_id] = @admin
      post :create, project_id: @project, :membership =>
      {project_id: @project.id, user_id: @user, role: 'member'}
      expect(response).to redirect_to(project_memberships_path(@project))

      session[:user_id] = @user
      put :update, project_id: @project, id: @user
      expect(response.status).to eq(404)
    end

    it "does not allow members to update" do
      session[:user_id] = @admin
      post :create, project_id: @project, :membership =>
      {project_id: @project.id, user_id: @user, role: 'member'}
      expect(response).to redirect_to(project_memberships_path(@project))

      session[:user_id] = @member
      put :update, project_id: @project, id: @user
      expect(response.status).to eq(404)
    end

  end


  # ----------------------> #DESTROY <----------------------------


  describe "#destroy" do

    it "does not allow non-members to destroy" do
      session[:user_id] = @user
      member_count = @project.memberships.where('role=?', 'member').count
      delete :destroy, project_id: @membership.project, id: @membership
      expect(@project.memberships.where('role=?', 'member').count).to eq(member_count)
    end

    it "does not allow member to destroy" do
      session[:user_id] = @member
      member_count = @project.memberships.where('role=?', 'member').count
      delete :destroy, project_id: @membership.project, id: @membership
      expect(@project.memberships.where('role=?', 'member').count).to eq(member_count)
    end

    it "does not allow last owner to be destroyed" do
      session[:user_id] = @owner
      owner_count = @project.memberships.where('role=?', 'owner').count
      delete :destroy, project_id: @membership.project, id: @membership
      expect(@project.memberships.where('role=?', 'owner').count).to eq(owner_count)
    end

    it "allows owner to be destroyed when multiple owners exist" do
      @owner = User.create!(
        first_name: "Josh",
        last_name: "Example",
        password: "password",
        email: "josh@example.com"
      )
      @membership = Membership.create!(
        user_id: @owner.id,
        project_id: @project.id,
        role: 'owner'
      )
      session[:user_id] = @owner
      owner_count = @project.memberships.where('role=?', 'owner').count
      delete :destroy, project_id: @membership.project, id: @membership
      expect(@project.memberships.where('role=?', 'owner').count).to eq(owner_count -1)
    end

    it "allows member to destroy self" do

      @membership2 = Membership.create!(
        user_id: @user.id,
        project_id: @project.id,
        role: 'member'
      )
      session[:user_id] = @membership2.user
      member_count = @project.memberships.where('role=?', 'member').count
      delete :destroy, project_id: @membership2.project, id: @membership2
      expect(@project.memberships.where('role=?', 'member').count).to eq(member_count -1)
    end

    it "allows admin to destroy" do
      @membership2 = Membership.create!(
        user_id: @user.id,
        project_id: @project.id,
        role: 'member'
      )
      session[:user_id] = @admin
      member_count = @project.memberships.where('role=?', 'member').count
      delete :destroy, project_id: @membership2.project, id: @membership2
      expect(@project.memberships.where('role=?', 'member').count).to eq(member_count -1)
    end

  end

end

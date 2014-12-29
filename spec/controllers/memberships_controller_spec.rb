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


  describe "#index" do

    it "visitors cannot see index" do
      session[:user_id] = nil
      get :index, project_id: @project.id
      expect(response.status).to redirect_to(signin_path)
    end

    it "non-members cannot see index" do
      session[:user_id] = @user.id
      get :index, project_id: @project.id
      expect(response.status).to eq(404)
    end

    it "members can see index" do
      session[:user_id] = @member.id
      get :index, project_id: @project.id
      expect(response).to render_template('index')
    end

    it "owners can see index" do
      session[:user_id] = @owner.id
      get :index, project_id: @project.id
      expect(response).to render_template('index')
    end

    it "admins can see index" do
      session[:user_id] = @admin.id
      get :index, project_id: @project.id
      expect(response).to render_template('index')
    end

  end


  # ----------------------> #CREATE <----------------------------


  describe "#create" do

    it "visitors cannot create" do
      session[:user_id] = nil
      post :create, project_id: @project.id
      expect(response.status).to redirect_to(signin_path)
    end

    it "non-members cannot create" do
      session[:user_id] = @user.id
      post :create, project_id: @project, id: @user
      expect(response.status).to eq(404)
    end

    it "members cannot create" do
      session[:user_id] = @member.id
      post :create, project_id: @project, id: @user.id
      expect(response.status).to eq(404)
    end

    it "admin can create" do
      session[:user_id] = @admin.id
      post :create, project_id: @project.id, :membership =>
      {project_id: @project.id, user_id: @user, role: 'member'}
      expect(response).to redirect_to(project_memberships_path(@project))
    end

  end


  # ----------------------> #UPDATE <----------------------------



  # ----------------------> #DESTROY <----------------------------


  describe "#destroy" do

    it "non-member cannot destroy member" do
      session[:user_id] = @user.id
      member_count = @project.memberships.where('role=?', 'member').count
      delete :destroy, project_id: @membership.project.id, id: @membership.id
      expect(@project.memberships.where('role=?', 'member').count).to eq(member_count)
    end

    it "member cannot destroy member" do
      session[:user_id] = @member.id
      member_count = @project.memberships.where('role=?', 'member').count
      delete :destroy, project_id: @membership.project.id, id: @membership.id
      expect(@project.memberships.where('role=?', 'member').count).to eq(member_count)
    end

    it "cannot destroy last owner" do
      session[:user_id] = @owner.id
      owner_count = @project.memberships.where('role=?', 'owner').count
      delete :destroy, project_id: @membership.project.id, id: @membership.id
      expect(@project.memberships.where('role=?', 'owner').count).to eq(owner_count)
    end

    it "owner can destroy owner when multiple owners exist" do
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
      session[:user_id] = @owner.id
      owner_count = @project.memberships.where('role=?', 'owner').count
      delete :destroy, project_id: @membership.project.id, id: @membership.id
      expect(@project.memberships.where('role=?', 'owner').count).to eq(owner_count -1)
    end

    it "member can destroy self" do

      @membership2 = Membership.create!(
        user_id: @user.id,
        project_id: @project.id,
        role: 'member'
      )
      session[:user_id] = @membership2.user.id
      member_count = @project.memberships.where('role=?', 'member').count
      delete :destroy, project_id: @membership2.project.id, id: @membership2.id
      expect(@project.memberships.where('role=?', 'member').count).to eq(member_count -1)
    end

    it "admin can destroy" do
      @membership2 = Membership.create!(
        user_id: @user.id,
        project_id: @project.id,
        role: 'member'
      )
      session[:user_id] = @admin.id
      member_count = @project.memberships.where('role=?', 'member').count
      delete :destroy, project_id: @membership2.project.id, id: @membership2.id
      expect(@project.memberships.where('role=?', 'member').count).to eq(member_count -1)
    end

  end

end

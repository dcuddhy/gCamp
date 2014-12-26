require 'rails_helper'

describe MembershipsController do
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
    end

# ----------------------> #INDEX <----------------------------



# ----------------------> #CREATE <----------------------------



# ----------------------> #UPDATE <----------------------------



# ----------------------> #DESTROY <----------------------------

  describe "#destroy" do
    it "cannot destroy last owner" do
      membership1 = @membership
      session[:user_id] = membership1.user.id
      owner_count = @project.memberships.where('role=?', 'owner').count
      delete :destroy, project_id: membership1.project.id, id: membership1.id
      expect(@project.memberships.where('role=?', 'owner').count).to eq(owner_count)
    end
  end




end

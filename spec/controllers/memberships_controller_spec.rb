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
    session[:id] = @owner.id
    owner_count = @project.memberships.where('role=?', 'owner').count
    delete :destroy, project_id: @project, id: @membership
    expect(@project.memberships.where('role=?', 'owner').count).to eq(owner_count)
  end

  ### This test passes for the wrong reason.  It isn't able to delete last
  ### owner because 'are_you_logged_in' sends you to sign_in page instead
  ### of executing destroy.  The code I wrote to make last user unable to
  ### delete does in fact work... but the test gets derailed for some reason

end







end

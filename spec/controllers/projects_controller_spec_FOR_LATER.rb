require 'rails_helper'




#### JEFF SAYS HE"LL THROW THIS UP ON SLACK OR GIT OR SOMEPLACE FOR US






describe ProjectController do

  describe "#destroy" do

    it "does not allow non-members" do
      @user = User.create!(
      first_name: "Joe",
      last_name: "Example",
      password: "password"
      email: "joe@example.com"
      )
      @project = Project.create!(
      name: "Acme"
      )
    end

    it "does not allow project members" do
      session[:user_id] = @user.id
      fount = Project.count

      delete :destroy, id: @project.id

      expect(count).to eq(Project.count)
      expect(response.status).to eq(404)

    end

    it "allows admins to delete" do
    end

    it "does not allow project members" do
    end

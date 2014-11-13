require "rails_helper.rb"

  describe "users" do

  it "validates presence of user" do
    user = User.create(
    first_name:"Jimmy",
    last_name:"Jones",
    email:"j@j.com",
    password:"pass",
    password_confirmation:"pass")
    user.valid?
    expect(user.errors.present?).to eq(false)
  end

  it "validates uniqueness of user's email" do
    user = User.create(
    first_name:"Jimmy",
    last_name:"Jones",
    email:"j@j.com",
    password:"pass",
    password_confirmation:"pass")
    user.valid?

    user = User.create(
    first_name:"Jermane",
    last_name:"Johnson",
    email:"j@j.com",
    password:"pass",
    password_confirmation:"pass")
    expect(user.errors.present?).to eq(true)
  end

  it "validates uniqueness of user's email, despite case" do
    user = User.create(
    first_name:"Jimmy",
    last_name:"Jones",
    email:"j@j.com",
    password:"pass",
    password_confirmation:"pass")
    user.valid?

    user = User.create(
    first_name:"Jermane",
    last_name:"Johnson",
    email:"J@j.com",
    password:"pass",
    password_confirmation:"pass")
    expect(user.errors.present?).to eq(true)
  end

end

class Membership < ActiveRecord::Base

  belongs_to :project
  belongs_to :user

  validates :user, presence: true
  validates :role, presence: true

  validates :user, uniqueness: {scope: :project,
  message: "has already been added"}

end

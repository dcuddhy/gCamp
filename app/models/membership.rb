class Membership < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  validates :user, presence: true
  validates :role, presence: true

end

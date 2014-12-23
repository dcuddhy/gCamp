class Project < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, case_sensitive: false

  has_many :tasks, dependent: :destroy

  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships

end

class Project < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :tasks

  has_many :memberships
  has_many :users, through: :memberships

  validates_uniqueness_of :users, case_sensitive: false


end

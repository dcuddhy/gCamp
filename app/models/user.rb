class User < ActiveRecord::Base

validates :first_name, presence: true
validates :last_name, presence: true
validates :email, presence: true, uniqueness: true
validates_uniqueness_of :email, case_sensitive: false
  has_secure_password

  has_many :memberships
  has_many :projects, through: :memberships

  has_many :tasks
  has_many :comments


end

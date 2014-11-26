class User < ActiveRecord::Base

  def full_name
    "#{first_name} #{last_name}"
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email, case_sensitive: false
    has_secure_password

  has_many :memberships, dependent: :destroy
  has_many :projects, through: :memberships



  has_many :tasks
  has_many :comments, dependent: :nullify


#has_many memberships and has many tasks may not be necessary

end

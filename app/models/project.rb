class Project < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :tasks

end

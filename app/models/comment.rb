class Comment < ActiveRecord::Base
  validates :details, presence: true

  belongs_to :task
  belongs_to :user
end

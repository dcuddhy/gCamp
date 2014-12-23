class Task < ActiveRecord::Base
  validates :description, presence: true

  validate :not_past_date, on: :create

  def not_past_date
    if due_date && due_date < Date.today
      errors.add(:due_date, 'cannot be in past')
    end
  end

  belongs_to :project

  has_many :users
  has_many :comments, dependent: :destroy

end

class Task < ActiveRecord::Base
  validates :description, presence: true

  validate :not_past_date

  def not_past_date
    if self.due_date < Date.today
      errors.add(:due_date, 'cannot be in past')
    end
  end



end

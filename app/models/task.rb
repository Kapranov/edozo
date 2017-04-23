class Task < ApplicationRecord
  belongs_to :project, inverse_of: :tasks, counter_cache: true

  validates :name, presence: true

  def is_completed
    if self.completed == true
      return 'completed'
    end
  end
end

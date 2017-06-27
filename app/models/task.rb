class Task < ApplicationRecord
  belongs_to :task_category
  belongs_to :user
  has_many :task_logs, dependent: :restrict_with_error
  
  validates_presence_of :name
  
  def to_s
    "#{self.name} - #{self.description}"
  end
end

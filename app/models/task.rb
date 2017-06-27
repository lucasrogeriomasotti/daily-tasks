class Task < ApplicationRecord
  belongs_to :task_category
  belongs_to :user
  has_many :task_logs, dependent: :restrict_with_error
  
  validates_presence_of :name
  
  def to_s
    return "#{self.name} - #{self.description}" if self.description.present?
    return self.name
  end
end

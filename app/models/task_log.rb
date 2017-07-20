class TaskLog < ApplicationRecord
  belongs_to :user
  belongs_to :task, optional: true
  
  validates_presence_of :date
  
  def url
    self.task.category_reference_url if task.present?
  end
end

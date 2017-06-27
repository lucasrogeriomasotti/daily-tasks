class TaskLog < ApplicationRecord
  belongs_to :user
  belongs_to :task, optional: true
  
  validates_presence_of :date
end

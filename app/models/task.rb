class Task < ApplicationRecord
  belongs_to :task_category
  belongs_to :user
  
  validates_presence_of :name
end

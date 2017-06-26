class TaskCategory < ApplicationRecord
  belongs_to :user
  
  validates_presence_of :name
  
  def to_s
    self.name
  end
end

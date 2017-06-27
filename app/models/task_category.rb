class TaskCategory < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :restrict_with_error
  
  validates_presence_of :name
  
  def to_s
    self.name
  end
end

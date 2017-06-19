class DailyTask < ApplicationRecord
  belongs_to :user
  
  validates_presence_of :user
  validates_presence_of :name
  validates_presence_of :duration
  validates_presence_of :date
end

class User < ApplicationRecord
  has_many :daily_tasks
  
  def to_s
    self.email
  end
  
  # Include default devise modules. Others available are:
  # :confirmable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable, :lockable
end

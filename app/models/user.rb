class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:driver, :passenger]
  
  validates :phone_number, uniqueness: true
  validates_length_of :name, minimum: 6
end

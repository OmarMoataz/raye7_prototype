class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:driver, :passenger]
  
  validates_presence_of :phone_number, :role
  validates :phone_number, uniqueness: true
  validates_length_of :name, minimum: 6


  has_many :trips, foreign_key: "driver_id", dependent: :destroy
  has_many :pickups, foreign_key: "passenger_id", dependent: :destroy
end

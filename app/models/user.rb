class User < ApplicationRecord
  enum role: [:driver, :passenger]
  
  validates :phone_number, uniqueness: true
  # validates :name, length: { minimum: 6 }
  validates_length_of :name, minimum: 6
end

class User < ApplicationRecord
  enum role: [:driver, :passenger]
  
  validates :phone_number, uniqueness: true
  validates_length_of :name, minimum: 6
end

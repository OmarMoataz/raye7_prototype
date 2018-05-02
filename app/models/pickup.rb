class Pickup < ApplicationRecord
  include Ridable

  validates :passenger, presence: true
  validates :departure_time, presence: true
  validate :user_is_a_passenger, if: :passenger
  validate :departure_time_cannot_be_in_the_past, if: :departure_time

  belongs_to :source, class_name: "Place"
  belongs_to :destination, class_name: "Place"
  belongs_to :passenger, class_name: "User"

  private

  def user_is_a_passenger
    unless passenger.role == "passenger"
      errors[:passenger] << "User is not a passenger"
      return false
    end
  end
end

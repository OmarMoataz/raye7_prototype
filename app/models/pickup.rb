class Pickup < ApplicationRecord
  include Ridable
  validate :user_role?, :departure_time_cannot_be_in_the_past

  belongs_to :source, class_name: "Place"
  belongs_to :destination, class_name: "Place"
  belongs_to :passenger, class_name: "User"

  private

  def user_role?
    unless passenger.role == "passenger"
      errors[:attribute] << "User is not a passenger"
      return false
    end
  end
end

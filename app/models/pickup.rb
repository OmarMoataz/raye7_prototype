class Pickup < ApplicationRecord
  validate :user_role?

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

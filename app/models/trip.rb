class Trip < ApplicationRecord
  validate :user_role?

  belongs_to :source, class_name: "Place"
  belongs_to :destination, class_name: "Place"
  belongs_to :driver, class_name: "User"

  private

  def user_role?
    unless driver.role == "driver"
      errors[:attribute] << "User is not a driver"
      return false
    end
  end
end

class Trip < ApplicationRecord
  include Ridable

  belongs_to :source, class_name: "Place"
  belongs_to :destination, class_name: "Place"
  belongs_to :driver, class_name: "User"

  validates :driver, presence: true
  validates :departure_time, presence: true
  validate :departure_time_cannot_be_in_the_past, if: :departure_time
  validate :user_is_a_driver, if: :driver

  private

  def user_is_a_driver
    unless driver.role == "driver"
      errors[:driver_id] << "User is not a driver"
      return false
    end
  end
end

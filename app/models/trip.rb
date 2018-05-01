class Trip < ApplicationRecord
  include Ridable

  belongs_to :source, class_name: "Place"
  belongs_to :destination, class_name: "Place"
  belongs_to :driver, class_name: "User"

  validates_associated :driver
  # validates :driver, presence: true
  validates_presence_of :departure_time
  validate :user_role?, :departure_time_cannot_be_in_the_past

  private

  def user_role?
    unless driver.role == "driver"
      errors[:driver_id] << "User is not a driver"
      return false
    end
  end
end

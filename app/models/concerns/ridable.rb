module Ridable
  extend ActiveSupport::Concern

  def departure_time_cannot_be_in_the_past
    unless departure_time >= 5.minutes.ago
      errors[:departure_time] << "Departure Time cannot be in the past"
      return false
    end
  end
end
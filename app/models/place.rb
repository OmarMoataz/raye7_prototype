class Place < ApplicationRecord
  validates_uniqueness_of(:name)
  validates :longitude, uniqueness: { scope: :latitude }

  has_many :source_trips, class_name: "Trip", foreign_key: "source_id"
  has_many :destination_trips, class_name: "Trip", foreign_key: "destination_id"

  has_many :source_pickups, class_name: "Pickup", foreign_key: "source_id"
  has_many :destination_pickups, class_name: "Pickup", foreign_key: "destination_id"

end

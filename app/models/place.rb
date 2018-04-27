class Place < ApplicationRecord
  validates_uniqueness_of(:name)
  validates :longitude, uniqueness: { scope: :latitude }

end

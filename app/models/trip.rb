class Trip < ApplicationRecord
  belongs_to :source, class_name: "Place"
  belongs_to :destination, class_name: "Place"
end

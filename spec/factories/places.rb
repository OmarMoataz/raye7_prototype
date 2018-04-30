FactoryBot.define do
  factory :place, aliases: [:destination, :source] do
    name { Faker::Lorem.characters(10) }
    longitude { Faker::Lorem.characters(10) }
    latitude { Faker::Lorem.characters(10) }

  end
end
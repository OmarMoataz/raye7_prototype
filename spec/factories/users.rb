FactoryBot.define do
  factory :user, aliases: [:driver, :passenger] do
    name { Faker::Lorem.characters(10) }
    email { Faker::Internet.email }
    password { "password123" }
    role { 'driver' }
    phone_number { Faker::Lorem.characters(10) }

    factory :driver_with_trips do
      transient do
        trips_count 2
      end

      after(:create) do |driver, evaluator|
        create_list(:trip, evaluator.trips_count, driver: driver )
      end
    end

    factory :passenger_with_pickups do
      transient do
        pickups_count 2
      end

      after(:create) do |passenger, evaluator|
        create_list(:pickup, evaluator.pickups_count, passenger: passenger )
      end
    end
  end

  # factory :passenger do
  #   name { Faker::Lorem.characters(10) }
  #   email { Faker::Internet.email }
  #   password { "password123" }
  #   role { 'passenger' }

  #   factory :passenger_with_pickups do
  #     transient do
  #       pickups_count 2
  #     end

  #     after(:create) do |passenger, evaluator|
  #       create_list(:trip, evaluator.pickups_count, passenger: passenger )
  #     end
  #   end
  # end
end
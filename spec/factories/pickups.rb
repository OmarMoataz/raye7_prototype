FactoryBot.define do
  factory :pickup do
    departure_time { 10.minutes.from_now }
    passenger
    source
    destination

  end
end
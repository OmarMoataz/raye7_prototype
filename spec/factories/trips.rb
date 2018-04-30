FactoryBot.define do
  factory :trip do
    departure_time { 10.minutes.from_now }
    driver
    source
    destination 
    number_seats { 5 }

  end
end
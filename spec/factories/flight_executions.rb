FactoryBot.define do
  factory :flight_execution do
    flight
    airplane
    departure_date_time { Faker::Time.between(DateTime.now + 1, DateTime.now + 1) }
    arrival_date_time { Faker::Time.between(DateTime.now + 1, DateTime.now + 1) }
  end
end

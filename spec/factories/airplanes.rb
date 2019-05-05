FactoryBot.define do
  factory :airplane do
    code { Faker::Alphanumeric.alpha 10 }
    seats_number { Faker::Number.number(2) }
  end
end

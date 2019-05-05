FactoryBot.define do
  factory :flight do
    code { Faker::Alphanumeric.alpha 10 }
    departure { Faker::Address.city }
    destination { Faker::Address.city }
  end
end

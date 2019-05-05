FactoryBot.define do
  factory :passenger do
    user
    flight
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    fiscal_code { Faker::Alphanumeric.alpha 16 }

    factory :invalid_passenger do
      fiscal_code { '' }
    end
  end
end

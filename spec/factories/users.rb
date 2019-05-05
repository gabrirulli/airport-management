FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }

    factory :invalid_user do
      email { '' }
    end
  end
end

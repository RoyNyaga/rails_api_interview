FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name } # TODO: required???
    password { Faker::Internet.password(min_length: 8) }
  end
end
FactoryBot.define do
  factory :category do
    name { Faker::Name.first_name }
    budget
  end
end

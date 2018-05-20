FactoryBot.define do
  factory :budget do
    name { Faker::Name.first_name }
  end
end

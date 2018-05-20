FactoryBot.define do
  factory :line_item do
    name { Faker::Name.first_name }
    category
  end
end

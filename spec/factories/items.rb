FactoryGirl.define do
  factory :item do
    name Faker::Commerce.product_name
    description Faker::Lorem.sentenct
    amount Faker::Number.between(0, 20)
  end
end

require 'faker'

FactoryGirl.define do
  factory :item do
    name Faker::Commerce.product_name
    description Faker::Lorem.sentence
    amount Faker::Number.between(0, 20)
  end
end

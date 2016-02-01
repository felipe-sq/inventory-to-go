require 'faker'

FactoryGirl.define do
  factory :item do
    name Faker::Commerce.product_name
    description Faker::Lorem.sentence
    amount Faker::Number.between(1, 25)
    reviewed false
    department
  end
end

# == Schema Information
#
# Table name: items
#
#  id            :integer          not null, primary key
#  name          :string
#  description   :text
#  amount        :integer
#  reviewed      :boolean          default(FALSE)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  department_id :integer
#

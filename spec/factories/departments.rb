require 'faker'

FactoryGirl.define do
  factory :department do
    name Faker::Commerce.department
    description Faker::Lorem.sentence
  end
end

# == Schema Information
#
# Table name: departments
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

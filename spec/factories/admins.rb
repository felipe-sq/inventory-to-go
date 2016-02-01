FactoryGirl.define do
  factory :admin do
    name "MyString"
email "MyString"
password "MyString"
  end

end

# == Schema Information
#
# Table name: admins
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  password   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

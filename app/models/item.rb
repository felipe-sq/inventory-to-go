class Item < ActiveRecord::Base
  belongs_to :department
end

# == Schema Information
#
# Table name: items
#
#  id            :integer          not null, primary key
#  name          :string
#  description   :text
#  amount        :integer
#  reviewed      :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  department_id :integer
#

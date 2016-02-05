class Item < ActiveRecord::Base
  belongs_to :department

end

# == Schema Information
#
# Table name: items
#
#  id              :integer          not null, primary key
#  name            :string
#  description     :text
#  amount          :integer
#  reviewed        :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  department_id   :integer
#  min_stock_level :integer          default(0)
#

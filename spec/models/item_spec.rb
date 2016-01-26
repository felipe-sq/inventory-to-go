require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
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

require 'rails_helper'

describe Department do
  it 'does something' do
    expect(1).to eq(1)
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

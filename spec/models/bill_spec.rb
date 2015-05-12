# == Schema Information
#
# Table name: bills
#
#  id          :integer          not null, primary key
#  name        :string
#  category_id :integer
#  price       :float
#  comment     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Bill, type: :model do

  it { should belong_to :category }

  it { should validate_presence_of :name }
  it { should validate_presence_of :price }
end

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

FactoryGirl.define do

  factory :bill do
    sequence(:name) { |n| "bill #{n}" }
    category
    price 1.5
    comment "bleeding"
  end
end

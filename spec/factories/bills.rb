# == Schema Information
#
# Table name: bills
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  category_id :integer
#  price       :float            not null
#  comment     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

FactoryGirl.define do

  factory :bill do
    sequence(:name) { |n| "bill #{n}" }
    category
    price 1.5
    comment "bleeding"
  end
end

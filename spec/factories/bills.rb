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
#  at          :datetime         default(Thu, 14 May 2015 01:05:20 CST +08:00), not null
#  status      :string           default("paid"), not null
#

FactoryGirl.define do

  factory :bill do
    sequence(:name) { |n| "bill #{n}" }
    category
    price 1.5
    comment "bleeding"
    sequence(:at) { |n| Time.now - n.day }
  end
end

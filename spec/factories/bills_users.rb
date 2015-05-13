# == Schema Information
#
# Table name: bills_users
#
#  id         :integer          not null, primary key
#  bill_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :bills_user do
    bill nil
user nil
  end

end

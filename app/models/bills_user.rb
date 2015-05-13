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

class BillsUser < ActiveRecord::Base
  belongs_to :bill
  belongs_to :user
end

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
#  at          :datetime         default(Wed, 13 May 2015 19:55:34 CST +08:00), not null
#  status      :string           default("paid"), not null
#

class Bill < ActiveRecord::Base

  STATUSES = ['paid', 'abandoned', 'pending']
  include StandardStatus

  belongs_to :category
  belongs_to :user
  has_and_belongs_to_many :users

  validates :name, presence: true
  validates :price, presence: true
  validates :at, presence: true

  default_value_for :at do
    Time.now
  end
end

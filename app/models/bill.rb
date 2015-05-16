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

class Bill < ActiveRecord::Base

  STATUSES = ['paid', 'abandoned', 'pending']
  include StandardStatus

  belongs_to :category
  belongs_to :user
  has_and_belongs_to_many :users
  has_many :bills_users

  validates :name, presence: true
  validates :price, presence: true
  validates :at, presence: true

  default_value_for :at do
    Time.now
  end

  after_commit :update_category_weight, :update_bills_users

  def update_category_weight
    category.update_weight if category
  end

  def update_bills_users
    bills_users.each do |bu|
      bu.update_attribute :price, price / bills_users.count
    end
  end
end

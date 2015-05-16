# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  weight     :integer          default(0), not null
#

class Category < ActiveRecord::Base

  has_many :bills

  validates :name, presence: true
  validates :weight, presence: true

  def update_weight
    update_attribute :weight, bills.count
  end
end

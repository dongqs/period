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

class Bill < ActiveRecord::Base
  belongs_to :category

  validates :name, presence: true
  validates :price, presence: true
end

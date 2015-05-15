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

class Bill < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_and_belongs_to_many :users

  validates :name, presence: true
  validates :price, presence: true
  validates :at, presence: true

  after_initialize :default

  def default
    self.at ||= Time.now
  end
end

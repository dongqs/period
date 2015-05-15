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

require 'rails_helper'

RSpec.describe Bill, type: :model do

  it { expect(Bill.ancestors).to be_include StandardStatus }

  it { should belong_to :category }
  it { should belong_to :user }
  it { should have_and_belong_to_many :users }

  it { should validate_presence_of :name }
  it { should validate_presence_of :price }
  it { should validate_presence_of :at }
  it { should validate_presence_of :status }
end

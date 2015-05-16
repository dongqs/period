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

require 'rails_helper'

RSpec.describe Bill, type: :model do

  it { expect(Bill.ancestors).to be_include StandardStatus }

  it { should belong_to :category }
  it { should belong_to :user }
  it { should have_and_belong_to_many :users }
  it { should have_many :bills_users }

  it { should validate_presence_of :name }
  it { should validate_presence_of :price }
  it { should validate_presence_of :at }
  it { should validate_presence_of :status }

  it "default at to now" do
    expect((Time.now - Bill.new.at).to_i).to eq 0
  end

  it "update categories weight" do
    bill = FactoryGirl.create :bill
    expect(bill.category.weight).to eq 1
  end

  it "set price of bills_users" do
    u1 = FactoryGirl.create :user
    u2 = FactoryGirl.create :user
    bill = FactoryGirl.create :bill, users: [u1, u2], price: 2.0
    expect(BillsUser.first.price).to eq 1.0
  end
end

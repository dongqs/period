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

require 'rails_helper'

RSpec.describe Category, type: :model do

  it { should have_many(:bills) }

  it { should validate_presence_of :name }
  it { should validate_presence_of :weight }

  it "#update_weight" do
    bill = FactoryGirl.create :bill
    category = bill.category
    expect(category.weight).to eq 1
  end
end

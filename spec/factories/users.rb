# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#  username               :string
#  authentication_token   :string
#

FactoryGirl.define do
  factory :user do
    factory :normal do
      after(:create) do |user|
        user.grant :normal
      end
    end

    factory :admin do
      after(:create) do |user|
        user.grant :normal
        user.grant :admin
      end
    end

    factory :system do
      after(:create) do |user|
        user.grant :normal
        user.grant :system
      end
    end
    sequence(:username) { |n| "test#{n}" }
    sequence(:email) { |n| "test#{n}@exampl.com" }
    password "password"
    password_confirmation "password"
    
  end

end

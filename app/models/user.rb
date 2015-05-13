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

class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :bills

  # crosstie skeleton

  # ldap

  # grant roles
  after_create :grant_roles, if: Proc.new {
    !Rails.env.test? && User.count == 1
  }

  def grant_roles
    Role::USER_ROLES.each do |role|
      self.grant role
    end
  end

  # grant normal
  after_create :grant_normal, if: Proc.new {
    ENV['GRANT_NORMAL']
  }

  def grant_normal
    self.grant :normal
  end

  # username
  alias_attribute :name, :username

  # authentication_token
  before_save :ensure_authentication_token

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end

  # authorization

  def managing_roles
    roles = []
    roles += [:system, :admin] if has_role? :system
    roles += [:normal] if has_role? :admin
    roles.uniq
  end

end

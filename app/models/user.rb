# frozen_string_literal: true

class User < ApplicationRecord
  include Clearance::User
  validates_presence_of(
    :name,
    :email,
    :phone,
    :password,
    :birthdate,
    :gender,
    on: :create
  )
  validates_numericality_of(:phone)

  has_many :authentications, dependent: :destroy
  has_and_belongs_to_many :projects

  def self.create_with_auth_and_hash(authentication, auth_hash)
    user = create!(
      name: auth_hash['info']['name'],
      email: auth_hash['info']['email'],
      password: SecureRandom.hex(10)
    )
    user.authentications << authentication
    user
  end

  # grab google to access google for user data
  def linkedin_token
    x = authentications.find_by(provider: 'linkedin')
    return x.token unless x.nil?
  end
end

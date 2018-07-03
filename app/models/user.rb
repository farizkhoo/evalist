# frozen_string_literal: true

class User < ApplicationRecord
  include Clearance::User
  validates_presence_of(
    :first_name,
    :last_name,
    :email,
    :phone_number,
    :job_title,
    :date_of_birth,
    :encrypted_password
  )
  def self.create_with_auth_and_hash(authentication, auth_hash)
    user = create!(
      email: auth_hash['info']['email'],
      password: SecureRandom.hex(10)
    )
    user.authentications << authentication
    user
  end
end

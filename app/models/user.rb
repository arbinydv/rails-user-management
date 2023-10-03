class User < ApplicationRecord
  has_secure_password
  has_many :contents

  # Aliases to support Postman request
  alias_attribute :firstName, :first_name
  alias_attribute :lastName, :last_name

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: {with: URI::MailTo::EMAIL_REGEXP, message: "Please use a valid email address."}
  validates :country, presence: true
end

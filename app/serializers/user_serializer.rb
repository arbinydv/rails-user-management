class UserSerializer < ActiveModel::Serializer
  attributes :id, :firstName, :lastName, :email, :country

  validates :firstName, presence: true
  validates :lastName, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end

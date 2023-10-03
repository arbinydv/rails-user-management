class Content < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: { message: "Body cannot be empty." }
 
end

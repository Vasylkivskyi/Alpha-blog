class User < ApplicationRecord
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 50 }
  validates :email, presence: true, uniqueness: true, length: {maximum: 105}, format: { with: URI::MailTo::EMAIL_REGEXP }




end

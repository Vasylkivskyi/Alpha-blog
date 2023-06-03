class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { minimum: 3, maximum: 50 }
  validates :email, presence: true, uniqueness: true, length: {maximum: 105}, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :articles
end

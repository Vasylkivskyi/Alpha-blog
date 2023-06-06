class User < ApplicationRecord
  validates :username,
            presence: true,
            uniqueness: {
              case_sensitive: false
            },
            length: {
              minimum: 3,
              maximum: 50
            }
  validates :email,
            presence: true,
            uniqueness: true,
            length: {
              maximum: 105
            },
            format: {
              with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
              on: :create
            }

  has_many :articles, dependent: :destroy
  has_secure_password
  before_save { self.email = email.downcase }
end

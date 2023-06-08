class Category < ApplicationRecord
  validates :name,
            presence: true,
            uniqueness: {
              case_sensitive: false
            },
            length: {
              minimum: 3,
              maximum: 20
            }

  has_many :article_categories
  has_many :articles, through: :article_categories
  paginates_per 10
end

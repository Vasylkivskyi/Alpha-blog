class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 6, maximum: 100 }
  validates :description,
            presence: true,
            length: {
              minimum: 10,
              maximum: 10_000
            }

  belongs_to :user

  has_many :article_categories
  has_many :categories, through: :article_categories
  paginates_per 20
end

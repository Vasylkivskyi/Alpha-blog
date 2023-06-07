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

  paginates_per 10
end

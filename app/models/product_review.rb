class ProductReview < ApplicationRecord
  belongs_to :product
  belongs_to :user
  has_many :product_review_files
end

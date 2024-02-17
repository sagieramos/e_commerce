class Product < ApplicationRecord
  belongs_to :seller, class_name: 'User'
  has_many :order_products
  has_many :orders, through: :order_products
  has_many :reviews
end

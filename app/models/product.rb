class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :carted_products
  has_many :orders, through: :carted_products
  has_many :category_products
  has_many :categories, through: :category_products

  def self.discounted_products
    Product.where("price < ?", 50)
  end

  def tax
    return price * 0.09
  end
end

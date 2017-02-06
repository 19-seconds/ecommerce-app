class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :orders

  def self.discounted_products
    Product.where("price < ?", 50)
  end

  def tax
    return price * 0.09
  end
end

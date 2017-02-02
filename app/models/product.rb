class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images

  def self.discounted_products
    Product.where("price < ?", 50)
  end

  def tax
    return price * 0.09
  end
end

class CartedProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true
  validate :quantity_must_be_less_than_5

  def quantity_must_be_less_than_5
    if quantity && quantity >= 5
      errors.add(:quantity, "Sorry! Sale Items have a max of quantity 5")
    end
  end


end

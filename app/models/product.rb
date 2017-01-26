class Product < ApplicationRecord

  def tax
    return price * 0.09
  end
end

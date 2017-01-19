class ProductsController < ApplicationController

  def all_the_products
    @products = Product.all
    render "all_the_products.html.erb"
  end


end
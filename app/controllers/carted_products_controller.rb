class CartedProductsController < ApplicationController

  def index
    @carted_products = current_user.orders.find_by(completed: false).carted_products
  end


  def create
    order = current_user.orders.find_by(completed:false) || Order.create(user_id: current_user.id, completed: false)
    carted_product = CartedProduct.new(order_id: order.id, product_id: params[:product_id], quantity: params[:quantity])
    carted_product.save
    redirect_to "/carted_products"
  end
end

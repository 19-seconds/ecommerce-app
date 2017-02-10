class OrdersController < ApplicationController
  before_action :authenticate_user!


  def show
    @order = Order.find_by(id: params[:id])
  end

  def update
    order = Order.find_by(id: params[:id])
    total_tax = 0
    total_subtotal = 0
    order.carted_products.each do |carted_product|
      total_tax += (carted_product.product.tax * carted_product.quantity)
      total_subtotal += (carted_product.product.price * carted_product.quantity)
    end
    total_total = total_tax + total_subtotal
    order.assign_attributes(tax: total_tax, subtotal: total_subtotal, total: total_total, completed: true)
    #call method to charge credit card (Braintree or Swipe)
    order.save
    redirect_to "/orders/#{order.id}"
  end

end

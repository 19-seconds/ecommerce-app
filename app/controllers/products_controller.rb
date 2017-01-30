class ProductsController < ApplicationController

  def index
    if params[:sort]
      @products = Product.all.order(price: params[:price])
    elsif params[:filter] == "discount"
      @products = Product.where("price < ?", 251)
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def new
  end

  def create
    product = Product.new({
      name: params[:name],
      description: params[:description],
      price: params[:price],
      image: params[:image]
      })
    product.save
    flash[:success] = "Product Created"
    redirect_to "/products/#{product.id}"
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    product = Product.find_by(id: params[:id])
    product.assign_attributes({
      name: params[:name],
      description: params[:description],
      price: params[:price],
      image: params[:image]
    })
    product.save
    flash[:success] = "Product Updated"  
    redirect_to "/products/#{product.id}"

  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    flash[:danger] = "Product Deleted"
    redirect_to "/products"
  end

end
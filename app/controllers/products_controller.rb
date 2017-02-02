class ProductsController < ApplicationController

  def index
    if session[:count] == nil
      session[:count] = 0
    end
    session[:count] += 1
    @visit_count = session[:count]


    if params[:sort]
      @products = Product.all.order(price: params[:price])
    elsif params[:filter] == "discount"
      @products = Product.discounted_products
    else
      @products = Product.all
    end
  end

  def show
    if params[:id] == "random"
      @product = Product.all.sample
    else
      @product = Product.find_by(id: params[:id])
    end
  end

  def new
    @suppliers = Supplier.all
  end

  def create
    product = Product.new({
      name: params[:name],
      description: params[:description],
      price: params[:price],
      supplier_id: params[:supplier_id]
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

  def search
    search_query = params[:search_input]
    @products = Product.where("name LIKE ? OR description LIKE ?", "%#{search_query}%", "%#{search_query}%")
    if @products.empty?
      flash[:info] = "No products found in search"
    end
    render :index
  end

end
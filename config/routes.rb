Rails.application.routes.draw do
  get "/all_products", to: 'products#all_the_products'  
end

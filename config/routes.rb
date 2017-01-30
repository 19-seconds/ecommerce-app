Rails.application.routes.draw do
  root to: 'products#index'
  get "/products", to: 'products#index'
  get "/products/new", to: 'products#new' 
  post "/products/search", to: 'products#search'
  get "/products/:id", to: 'products#show'
  post "/products", to: 'products#create'
  get "/products/:id/edit", to: 'products#edit'
  patch "/products/:id", to: 'products#update'
  delete "/products/:id", to: 'products#destroy'
end

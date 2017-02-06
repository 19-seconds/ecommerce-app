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

  get "/signup", to: "users#new"
  post "/users", to: "users#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  post "/orders", to: 'orders#create'
  get "/orders/:id", to: 'orders#show'
end

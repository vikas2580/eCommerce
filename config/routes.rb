Rails.application.routes.draw do
  resources :users, only: [:create]
  resources :sessions, only: [:create, :destroy]
  resources :products
  resources :categories
  resources :orders
  resources :cart, only: [:index, :create, :update, :destroy]
end

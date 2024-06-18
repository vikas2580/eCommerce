Rails.application.routes.draw do
  resources :users, only: [:create]
  resources :sessions, only: [:create, :destroy]
  resources :products
  resources :categories
  resources :orders
  resources :cart, only: [:index, :create, :update, :destroy]

  
  namespace :admin do
    resources :products, only: [:create, :update, :destroy]
    resources :orders, only: [:index, :show, :update, :destroy]
  end
end

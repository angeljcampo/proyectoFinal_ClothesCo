Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root 'products#index'
  resources :payments
  resources :carts, only: [:show, :update, :destroy]
  resources :orders
  resources :products
  resources :categories
  post '/rate' => 'rater#create', :as => 'rate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

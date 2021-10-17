Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :payments
  root 'products#index'
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
  resources :carts, only: [:show, :update, :destroy]
  resources :orders
  resources :products
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

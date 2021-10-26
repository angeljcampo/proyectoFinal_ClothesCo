Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root 'products#index'

  resources :carts, only: [:show, :update, :destroy] do
    member do
      post :pay_with_paypal
      get :process_paypal_payment
    end
  end
  
  resources :payments
  resources :orders
  resources :products
  resources :categories
  post '/rate' => 'rater#create', :as => 'rate'
  
end


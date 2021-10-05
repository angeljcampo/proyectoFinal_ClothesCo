Rails.application.routes.draw do
  root 'products#index'
    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }

  resources :orders
  resources :products
  resources :subcategories
  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

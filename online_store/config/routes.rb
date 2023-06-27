require 'sidekiq/web'

Rails.application.routes.draw do

  scope :cart, controller: 'carts' do
    get 'carts', to: 'cart#show'
    post 'carts/add'
    post 'carts/remove'
  end

  resources :products do
    resources :reviews
  end

  devise_for :users, controllers: { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'products#index'

  patch 'change_locale' => 'locales#change_locale'

  mount Sidekiq::Web => '/sidekiq'
end

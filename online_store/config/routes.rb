require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  scope :cart, controller: 'carts' do
    get 'carts', to: 'cart#show'
    post 'carts/add'
    post 'carts/remove'
  end

  resources :user, :products do
    resources :reviews
  end

  devise_for :users, controllers: { registrations: 'users/registrations' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'products#index'
  get 'search', to: 'products#search'

  patch 'change_locale' => 'locales#change_locale'

  mount Sidekiq::Web => '/sidekiq'
end

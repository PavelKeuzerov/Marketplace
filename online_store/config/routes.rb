Rails.application.routes.draw do
  resources :products
  devise_for :users, controllers: { registrations: 'users/registrations'}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"



  patch 'change_locale' => 'locales#change_locale'
end

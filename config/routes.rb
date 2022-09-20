Rails.application.routes.draw do
  resources :cities
  resources :users
  get 'hello_world/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

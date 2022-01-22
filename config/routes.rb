Rails.application.routes.draw do
  
  # get 'posts/index'
  root "posts#index"

  resources :posts


  get "signup", to: "users#new"
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

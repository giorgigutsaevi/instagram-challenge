Rails.application.routes.draw do
  get 'sessions/new'
  

  # root "posts#index"
  root "sessions#new"
  resources :posts

  get "signup", to: "users#new"
  resources :users
  
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"
  resources :sessions

  
end

Rails.application.routes.draw do

  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end
  
  use_doorkeeper
  namespace :api do
    resources :histories
    resources :books
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  get 'wallets/index'
  get 'histories/index'
  get 'books/index'
  get 'members/index'
  get 'books/show'
  get '/current_history/:id', to: "books#current_history"
  post '/show', to: "books#show"
  post '/issue', to: "books#issue"
  put '/return/:id', to: "books#return"
  root "members#index"
  get '/borrowed', to: "members#index"
  get "/wallet_card", to: "wallet_cards#show" 
  get "/wallet_card/new", to: "wallet_cards#new" 
  post "/wallet_card/create", to: "wallet_cards#create" 
  get "/wallet_card/recharge", to: "wallet_cards#recharge"
  post "/wallet_card/add", to: "wallet_cards#add"


  # resources :users
  resources :histories
  resources :books
  resources :wallets
  resources :wallet_cards
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html 
end

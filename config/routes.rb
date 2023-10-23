# frozen_string_literal: true

Rails.application.routes.draw do
  resources :accounts
  devise_for :users
  root "accounts#index"

  post "/items", to: "items#create"
  delete "/items/:id", to: "items#destroy"

  post "/accounts", to: "accounts#create"
  delete "/accounts", to: "accounts#destroy"

  get "/plaid/link_token", to: "plaid#create_link_token"
  # get "/plaid/public_token_exchange/:public_token", to: "plaid#public_token_exchange"
  post "/plaid/public_token_exchange", to: "plaid#public_token_exchange"

  post "/items", to: "item#create"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

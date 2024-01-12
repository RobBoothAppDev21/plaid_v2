# frozen_string_literal: true

Rails.application.routes.draw do
  # resource :accounts, controller: :accounts, only: [:create, :update, :destroy]
  resources :items, controller: :items, only: [:index, :create, :update, :destroy] do
    resources :accounts, only: [:index, :show]
  end
  devise_for :users
  root "items#index"

  get "/", to: "items#index"
  # get "/accounts", to: "accounts#index"
  # post "/items", to: "items#create"
  # delete "/items/:id", to: "items#destroy"

  # post "/accounts", to: "accounts#create"
  # delete "/accounts", to: "accounts#destroy"

  get "/plaid/link_token", to: "plaid#create_link_token"
  # get "/plaid/public_token_exchange/:public_token", to: "plaid#public_token_exchange"
  post "/plaid/public_token_exchange", to: "plaid#public_token_exchange"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

# frozen_string_literal: true

Rails.application.routes.draw do
  resources :posts do
    resources :comments, module: :posts, shallow: true
    resources :likes, module: :posts
  end
  devise_for :users

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'posts#index'
end

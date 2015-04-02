Rails.application.routes.draw do
  current_api_routes = lambda do
    resources :credentials, only: [:show]
  end

  namespace :api do
    namespace :v1, &current_api_routes
  end

  devise_for :users

  resources :access_controls
  resources :access_requests, only: [:index]
  resources :credentials
  resources :doorbots
  resources :users, only: [:edit, :update]
  get 'getting-started', to: 'getting_started#index'

  get 'versions', to: 'versions#index'
  get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  root 'dashboard#index'
end

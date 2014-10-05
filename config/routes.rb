Rails.application.routes.draw do
  current_api_routes = lambda do
    resources :credentials, only: [:show]
  end

  namespace :api do
    namespace :v1, &current_api_routes
  end

  devise_for :users

  resources :access_controls
  resources :credentials
  resources :doorbots
  resources :users, only: [:edit, :update]

  get 'versions', to: 'versions#index'
  get 'dashboard', to: 'dashboard#index', as: 'dashboard'
  root 'dashboard#index'
end

Rails.application.routes.draw do
  resource :users, only: [:edit, :update]

  get '/dashboard', to: 'dashboard#index', as: 'dashboard'

  devise_for :users

  root 'dashboard#index'
end

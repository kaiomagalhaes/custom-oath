Rails.application.routes.draw do
  use_doorkeeper
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create]
  delete '/logout', to: 'sessions#destroy', as: :logout
  root to: 'pages#index'
end

Rails.application.routes.draw do
  resources :users, only: %i[index show edit update destroy]
  resources :tasks
  root 'sessions#index'

  get 'auth/twitter/callback', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end

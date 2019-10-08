Rails.application.routes.draw do
  resources :users, only: %i[index show edit update destroy]
  resources :tasks
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'photographers#index'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get 'logged_in', to: 'sessions#is_logged_in?'

  resources :users, only: [:create, :show, :index]
  resources :reviews, only: [:create, :show, :index]
  resources :photographers
  # photographer 'rails/active_storage/direct_uploads', to: 'direct_uploads#create' 
end

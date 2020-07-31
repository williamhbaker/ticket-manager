Rails.application.routes.draw do
  root 'users#new'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :users, only: [:show, :create, :edit, :update]


end

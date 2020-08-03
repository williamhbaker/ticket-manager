Rails.application.routes.draw do
  root 'projects#index'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  resources :users, only: [:create]

  resources :projects
  resources :tags, except: [:show]
  resources :tickets do
    resources :comments, except: [:show, :new]
  end

end

Rails.application.routes.draw do
  get 'sessions/new'

  # static_pages
  root 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/help', to: 'static_pages#help'

  # users
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :account_activations, only: [:edit]


  # resources :microposts
  # resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'users#index'

  # get 'application#goodbye'
end

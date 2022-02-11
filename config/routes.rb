Rails.application.routes.draw do

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  root to: 'entrances#index'
  resources :entrances
  resources :tweets


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

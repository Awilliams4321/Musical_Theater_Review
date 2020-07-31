Rails.application.routes.draw do

  root 'users#new'
  resources :users, only: [:new, :show, :create]

  get '/reviews', to: 'reviews#index'
  get '/reviews/new', to: 'reviews#new'
  post '/reviews', to: 'reviews#create'
  get 'reviews/:id', to: 'reviews#show'
  get '/reviews/:id/edit', to: 'reviews#edit'
  resources :musicals


  get '/auth/github', as: 'github'
  get '/auth/github/callback', to: 'sessions#github'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do

  root 'users#new'
  resources :users, only: [:new, :show, :create]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#logout'

  resources :musicals, only: [:index] do
    resources :reviews
  end

  get '/musicals/:id', to: 'musicals#show', as: 'musical'

  get '/reviews', to: 'reviews#index'
  # get '/reviews/new', to: 'reviews#new'
  post '/reviews', to: 'reviews#create'
  # get '/reviews/:id', to: 'reviews#show', as: 'review'
  get '/reviews/:id/edit', to: 'reviews#edit'
  patch '/reviews/:id', to: 'reviews#update'
  # delete '/reviews/:id', to: 'reviews#destroy'


  get '/auth/github', as: 'github'
  get '/auth/github/callback', to: 'sessions#github'
  get '/auth/github/callback', to: 'sessions#github'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

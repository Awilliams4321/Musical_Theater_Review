Rails.application.routes.draw do
  get '/reviews', to: 'reviews#index'
  get '/reviews/new', to: 'reviews#new'
  post '/reviews', to: 'reviews#create'
  get 'reviews/:id', to: 'reviews#show'
  get '/reviews/:id/edit', to: 'reviews#edit'
  resources :musicals
  resources :users, only: [:new, :show, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

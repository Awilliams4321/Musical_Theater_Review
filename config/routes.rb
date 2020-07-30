Rails.application.routes.draw do
  get '/reviews/new', to: 'reviews#new'
  post '/reviews', to: 'reviews#create'
  resources :musicals
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

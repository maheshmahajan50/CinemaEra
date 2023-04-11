Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :movies, only: [:index, :show, :update]
  post '/mark_as_favorite', to: 'movies#create'
  get '/your_favorite', to: 'movies#favorite'

  resources :reviews, only: [:create, :index]
end

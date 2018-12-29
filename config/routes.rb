Rails.application.routes.draw do
  root 'application#home'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get 'users/new' => 'users#new'
  post 'users/new' => 'users#create'
  resources :users, except: [:new]

  resources :attractions, only: [:index, :show]
  post 'attractions/:id' => 'attractions#take_ride', as: :take_ride

  namespace :admin do
    resources :attractions
  end
end

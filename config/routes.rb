Rails.application.routes.draw do
  root 'application#home'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :users

  resources :attractions, only: [:index, :show, :create, :edit]
  post 'attractions/:id' => 'attractions#take_ride', as: :take_ride

  namespace :admin do
    resources :attractions, except: [:new, :show, :edit]
  end
end

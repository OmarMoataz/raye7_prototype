Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show]
  resources :trips, only: [:create, :destroy]
  resources :pickups, only: [:create, :destroy]

  root to: 'users#show'
end

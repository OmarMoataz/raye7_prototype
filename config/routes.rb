Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: 'v1' do
    resources :users, only: [:show]
    resources :trips, only: [:create, :destroy]
    resources :pickups, only: [:create, :destroy]
  end

  root to: 'v1/users#show'

  
end

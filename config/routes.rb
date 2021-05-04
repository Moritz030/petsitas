Rails.application.routes.draw do

  resources :pets, only: [:new, :create, :show, :destroy]
  resources :requests, only: [:destroy]
  
  root to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :users, only: [:edit, :update]
  resources :offers, only: [:index, :new, :destroy] do
    resources :requests, only: [:new, :create, :edit, :update]
  end
  resources :pets, only: [:show] do
  resources :offers, only: [:new, :create, :show] 
  end
  devise_for :users
end

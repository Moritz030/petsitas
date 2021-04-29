Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :users, only: [:edit, :update]
  resources :offers, only: [:index, :new]
  resources :pets, only: [:show] do
    resources :offers, only: [:new, :create]
  end
end

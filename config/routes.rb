Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show], controller: 'users'
  resources :card_posts, only: [:new, :create, :show, :index, :edit, :update, :destroy]

  root "card_posts#index"
end

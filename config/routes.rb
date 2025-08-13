Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  resources :card_posts, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  resources :users, only: [:show]


  root "card_posts#index"

end

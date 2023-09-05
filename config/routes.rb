Rails.application.routes.draw do
  devise_for :users

  resources :users, only: :index
  resources :foods, only: [:new, :create, :show, :destroy ]
  resources :recipes, only: [:new, :create, :show, :destroy ]
  root "foods#index"
end

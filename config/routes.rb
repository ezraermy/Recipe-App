Rails.application.routes.draw do
  devise_for :users

  resources :users, only: :index
  resources :foods
  resources :recipes, only: [:new, :create, :show, :destroy ]

  get '/general_shoping_list', to: 'foods#general_shoping_list'
  
  root "foods#index"
end

Rails.application.routes.draw do
  devise_for :users

  resources :users, only: :index
  resources :foods, only: [:index, :new, :create, :show, :destroy ]
  resources :recipes, only: [:index, :update, :new, :create, :show, :destroy ]

  get '/general_shoping_list', to: 'foods#general_shoping_list'
  get '/public_recipes', to: 'recipes#public_recipes'
  root "foods#index"
end

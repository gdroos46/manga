Rails.application.routes.draw do

  devise_for :users
  root "products#index"
  resources :products, only:  :show, shallow: true  do
  	resources :topics do
  		resources :comments, only: [:new,:create]
  	end
  end
  resources :users, only: [:show]
end

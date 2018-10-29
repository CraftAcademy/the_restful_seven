Rails.application.routes.draw do
  resources :premium_listings, only: [:show, :index]
  # get 'premium_listing/index'
  # get 'premium_listing/show'
  devise_for :users
 
  root controller: :main, action: :index
  
  namespace :admin do
    root controller: :dashboard, action: :index
    resources :articles, only: [:create, :show, :new, :update, :destroy, :edit]
  end
end

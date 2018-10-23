Rails.application.routes.draw do
  devise_for :users
  root controller: :main, action: :index
  
  namespace :admin do
    root controller: :articles, action: :new
    resources :articles, only: [:create, :show, :new]
  end
end

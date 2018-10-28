Rails.application.routes.draw do
  devise_for :users
 
  root controller: :main, action: :index, 

  namespace :admin do
    root controller: :dashboard, action: :index
    resources :articles, only: [:create, :show, :new, :update, :destroy, :edit]
  end
end

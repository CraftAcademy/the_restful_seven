Rails.application.routes.draw do
  root controller: :main, action: :index
  
  namespace :admin do
    root controller: :articles, action: :new
    resources :articles, only: [:create, :show, :new]
  end
end

Rails.application.routes.draw do
  root controller: :main, action: :index
  resources :articles, only: [:create, :show, :new]
end

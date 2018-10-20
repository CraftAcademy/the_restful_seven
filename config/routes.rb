Rails.application.routes.draw do
  resources :api_feed, only: [:index]
  root controller: :main, action: :index
end

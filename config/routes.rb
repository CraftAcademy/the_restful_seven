Rails.application.routes.draw do
  get 'api_feeds/index'
  root controller: :api_feeds, action: :index
  # resources :api_feeds, action: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

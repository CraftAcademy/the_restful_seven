Rails.application.routes.draw do
  resources :premium_listings, only: [:show, :index]
  devise_for :users
 
  root controller: :main, action: :index 
  resources :subscriptions, only: [:new, :create]

  namespace :admin do
    root controller: :dashboard, action: :index
    resources :articles, only: [:create, :show, :new, :update, :destroy, :edit]
    resources :user_management, only: [:index, :edit, :update, :destroy]
  end
  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth', skip: [:omniauth_callbacks], controllers: {
      sessions: 'api/sessions',
      registrations: 'api/registrations'
    }
  end
end

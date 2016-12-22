Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace :api, defaults: {format: :json}, constraints: {subdomain: 'api'}, path: '/' do
      resources :users, only: [:show, :create, :update, :destroy]
  end
end

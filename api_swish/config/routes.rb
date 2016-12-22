Rails.application.routes.draw do
  namespace :api, defaults: {format: :json}, constraints: {subdomain: 'api'}, path: '/' do
      resources :users, only: [:show, :create, :update, :destroy]
      mount_devise_token_auth_for 'User', at: 'auth'
  end
end

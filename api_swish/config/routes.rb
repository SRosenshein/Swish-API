Rails.application.routes.draw do
  namespace :api, defaults: {format: :json}, path: '/api' do
      resources :users, only: [:show, :create, :update, :destroy]
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :courts do
        get "search", on: :collection
      end
  end
end

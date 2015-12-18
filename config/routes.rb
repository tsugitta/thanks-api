Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :users, only: [:show, :create, :update]
    resources :user_sessions, only: [:create, :destroy]
  end
end

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :users, only: [:show, :create, :update] do
      collection do
        get 'search'
        get 'current_user'
      end
    end

    resources :user_sessions, only: [:create, :destroy] do
      post 'create_with_token', on: :collection
    end

    resources :thanks, only: [:index, :create, :destroy]
    resources :relationships, only: :create do
      delete :destroy, on: :collection
    end
  end
end

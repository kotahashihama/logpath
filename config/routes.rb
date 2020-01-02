Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:show], param: :username
      resources :tasks, only: [:index, :create, :update, :destroy]
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations'
    }
    end
  end
end

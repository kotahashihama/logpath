Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :dones
  root 'static_pages#home'

  namespace :api do
    namespace :v1 do
      resources :users, only: [:show], param: :username
      resources :dones, only: [:index, :create, :update, :destroy]
    end
  end
end

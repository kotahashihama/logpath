Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :dones
  root 'static_pages#home'

  namespace :api do
    namespace :v1 do
      resources :dones
    end
  end
end

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#index'
  resources :users do
    resources :posts
  end

  namespace :api, :defaults => {:format => :json} do
    resources :posts do
      resources :comments
    end
  end

  resources :posts do
    resources :comments
    resources :likes, only: %i[new create]
  end

  resources :comments, only: %i[destroy]
end

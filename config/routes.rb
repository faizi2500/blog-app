Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#index'
  resources :users do
    resources :posts
  end

  resources :posts do
    resources :comments
    resources :likes, only: %i[new create]
  end
end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'users#index'
  resources :users do
    resources :posts 
  end

  resources :posts do
    resources :comments
    resources :likes, only: [:new, :create]
  end
end

Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  resources :tweets do
    resources :comments, only: [:create]
    collection  do
      get 'search'
      get 'ranking'
    end
  end

  resources :users, only: [:show]
end
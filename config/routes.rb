Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root 'tweets#index'
  # get 'tweets/search' => 'tweets#search'
  resources :tweets do
    resources :comments, only: [:create]
    collection  do
      get 'search'
      get 'ranking'
      get 'detail'
    end
  end

  resources :users, only: [:show, :edit, :update]
end
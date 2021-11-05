Rails.application.routes.draw do
  devise_for :users
  root to: 'reservations#index'
  resources :reservations do
    resources :looks, only: [:create, :destroy]
    member do
      get 'oneday'
    end
  end
  resources :users, only: [:edit, :update]
end

Rails.application.routes.draw do
  devise_for :users
  root to: 'reservations#index'
  resources :reservations do
    member do
      get 'oneday'
    end
  end
  resources :users, only: [:edit, :update]
end

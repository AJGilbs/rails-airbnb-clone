Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :food_tours do
    resources :bookings, only: [ :create ]
  end
  resources :bookings, only: [ :edit, :update, :destroy ]
end

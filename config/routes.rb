Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations'}
  root to: 'pages#home'
  resources :food_tours do
    resources :bookings, only: [ :create ]
  end
  resources :bookings, only: [ :edit, :update, :destroy ]

  get 'dashboard', to: 'pages#dashboard'
end

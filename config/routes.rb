Rails.application.routes.draw do
  # facebook sign in
  # devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  # google+ sign in
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :custome_bookings
  resources :bookings
  root 'bookings#index'
  resources :customers
  resources :cleaners
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Routing for facebook authentication controller
end

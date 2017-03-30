Rails.application.routes.draw do
  resources :custome_bookings
  resources :bookings
  root 'customers#index'
  resources :customers
  resources :cleaners
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

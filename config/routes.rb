Rails.application.routes.draw do
  # devise_for :users, class_name: 'FormUser', :controllers => { omniauth_callbacks: 'omniauth_callbacks' }

  devise_for :users, :controllers => { :omniauth_callbacks => "my_engine/omniauth_callbacks" }, :class_name => "FormUser", module: :devise

  get '/auth/:provider/callback', to: 'sessions#create'
  get 'welcome/index'

  # facebook sign in
  # devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  # google+ sign in
  # devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :custome_bookings
  resources :bookings

  resources :customers
  resources :cleaners

  root 'bookings#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Routing for facebook authentication controller
  devise_scope :user do
    get '/users/auth/:provider/upgrade' => 'omniauth_callbacks#upgrade', as: :user_omniauth_upgrade
    get '/users/auth/:provider/setup', :to => 'omniauth_callbacks#setup'
  end
end

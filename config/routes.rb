Rails.application.routes.draw do
  root 'layouts#home'

  resources :customers, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :orders do 
    get 'confirmation', on: :member
  end
  resources :books, only: [:new, :create, :show]
  resources :deliveries
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  get '/howto', to: 'layouts#howto'
  get '/mydashboard', to: 'customers#dashboard'
  get '/mycart', to: 'customers#index'
  get '/checkout', to: 'orders#index'
  get '/delivery', to: 'orders#new'
  get 'confirmation', to: 'orders#confirmation'
end
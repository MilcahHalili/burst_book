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
  get '/faq', to: 'layouts#faq'
  get '/mydashboard', to: 'customers#dashboard'
  get '/cart', to: 'books#index'
  get '/checkout', to: 'deliveries#new'
  get '/payment', to: 'orders#payment'
  get '/confirmation', to: 'orders#confirmation'
end
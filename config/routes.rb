Rails.application.routes.draw do
  root 'layouts#home'

  resources :customers, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :orders do 
    resources :line_items, shallow: true
  end
  resources :books, only: [:new, :create, :show, :destroy]
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  get '/faq', to: 'layouts#faq'
  get '/dashboard', to: 'customers#dashboard'
  get '/confirmation', to: 'orders#confirmation'
end
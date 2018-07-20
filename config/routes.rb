Rails.application.routes.draw do
  root 'layouts#home'

  resources :customers, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  post '/checkout', to: 'orders#checkout', as: 'checkout'
  resources :orders do 
    resources :line_items, shallow: true
  end
  resources :books, only: [:new, :create, :show, :destroy]
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  get '/faq', to: 'layouts#faq'
  get '/dashboard', to: 'customers#dashboard'
  get '/confirmation', to: 'orders#confirmation'
  get '/about', to: 'layouts#about'
  get '/line_items/:id/inc', to: 'line_items#inc', as: 'inc'
  get '/line_items/:id/dec', to: 'line_items#dec', as: 'dec'
end
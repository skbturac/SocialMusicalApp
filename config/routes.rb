Rails.application.routes.draw do

  post '/friends', to: 'friendships#create'
  delete '/friends', to: 'friendships#destroy'

  root 'homes#index'
  get    '/help',    to: 'homes#help'
  get    '/about',   to: 'homes#about'
  get    '/contact', to: 'homes#contact'
  get    '/signup',  to: 'users#new', as: :new_user
  post   '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get    '/profile', to: "users#profile"

  resources :users
  resources :posts do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

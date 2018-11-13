Rails.application.routes.draw do

  root 'homes#index'
  get    '/help',    to: 'homes#help'
  get    '/about',   to: 'homes#about'
  get    '/contact', to: 'homes#contact'
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :posts do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

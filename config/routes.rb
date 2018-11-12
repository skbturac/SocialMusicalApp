Rails.application.routes.draw do
  root 'homes#index'
  get  '/help',    to: 'homes#help'
  get  '/about',   to: 'homes#about'
  get  '/contact', to: 'homes#contact'
  get '/users', to: 'users#index'
  get  '/signup',  to: 'users#new'
  resources :comments
  resources :posts
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

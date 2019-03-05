Rails.application.routes.draw do
  get 'session/new'

  get 'users/new'

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get '/signup'=>'users#new'
  post '/signup',  to: 'users#create'
  get '/login'=>'session#new'
  post '/login'=>'session#create'
  delete '/logout'=>'session#destroy'
  resources :users
end

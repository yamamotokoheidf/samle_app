Rails.application.routes.draw do
  get 'password_resets/new'

  get 'password_resets/edit'

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
  resources :users do
    member do
      get :following,:followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only:[:new,:create,:edit,:update]
  resources :microposts, only:[:create,:destroy]
  resources :relationships, only: [:create,:destroy]
end

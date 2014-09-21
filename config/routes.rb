Rails.application.routes.draw do

  #get 'users/new'

  resources :users

  root  to: 'static_pages#home', via: :get

  match '/help', to: 'static_pages#help', via: :get

  get '/about', to: 'static_pages#about'

  get '/signup', to: 'users#new'

  match '*a', to: 'application#routing_error', via: [:get, :post]



end

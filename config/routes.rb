Rails.application.routes.draw do
  resources :answers
  root 'sessions#new'
  get 'sessions/create'
  get 'sessions/exit'
  get 'sessions/sign_in'
  get 'sessions/sign_out'
  get 'calc/input'
  get 'calc/show'
  get 'users/xml'
  get 'users/json'
  resources :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

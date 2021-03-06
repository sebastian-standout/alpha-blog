Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :articles
  resources :users, except: [:new]

  root 'pages#home'

  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'
  get 'users', to: 'users#index'
  get 'login', to: 'sessions#new'

  post 'login', to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'
end

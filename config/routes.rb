Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get  "about", to: "pages#about"
  
  resources :articles, only: [:show, :index]

  root 'pages#home'
end

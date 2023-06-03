Rails.application.routes.draw do
  get "/about", to: 'pages#about'
  get "/register", to: 'users#new'
  post '/users', to: 'users#create'
  resources :users, expect: [:index, :new, :create, :delete ]
  resources :articles
  root "articles#index"
end

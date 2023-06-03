Rails.application.routes.draw do
  get "/about", to: 'pages#about'
  get "/register", to: 'users#new'
  post '/users', to: 'users#create'
  # get '/users/:id/edit', to: 'users#edit', as: :users_update
  # put '/users/:id', to: 'users#update'
  resources :users, expect: [:index, :new, :create, :delete ]
  resources :articles
  root "articles#index"
end

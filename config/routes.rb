Rails.application.routes.draw do
  # pages
  get "/about", to: 'pages#about'

  # users
  get "/register", to: 'users#new'
  post '/users', to: 'users#create'
  resources :users, expect: [:index, :new, :create, :delete ]

  # articles
  resources :articles do
    get '/page/:page', action: :index, on: :collection
  end

  # session
  get "/login", to: 'sessions#new'
  post "/login", to: 'sessions#create'
  delete "/logout", to: 'sessions#destroy'

  # root
  root "articles#index"
end

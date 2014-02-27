EverestApp::Application.routes.draw do
  # Home page
  root :to => "sessions#new"

  # Sessions
  get '/auth/:provider/callback', :to => 'sessions#create'
  get '/logout', :to => 'sessions#destroy'

  # Users
  get "/about" => "users#about"
  get '/users/run', to: 'users#run'

  # Goals
  get '/goals', to: 'goals#index', as: 'goals'
  get '/goals/new', to: 'goals#new', as: 'new_goal'
  post '/goals', to: 'goals#create'
  get '/goals/:id', to: 'goals#show', as: 'goal'
  patch '/goals/:id', to: 'goals#update'

end


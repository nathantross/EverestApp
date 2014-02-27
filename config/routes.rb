EverestApp::Application.routes.draw do

  # Home
  root :to => "sessions#new"

  # Sessions
  get '/auth/:provider/callback', :to => 'sessions#create'
  get '/logout', :to => 'sessions#destroy'

  # Users
  get '/run', to: 'users#run'
  get '/donut', to: 'users#donut'
  get '/user', to: 'users#index', as: 'users'
  get 'user/:id', to: 'users#show', as: 'user'
  get '/about', to: 'users#about', as: 'about'
  get '/quit', to: 'users#quit', as: 'quit'
  get '/restart', to: 'users#restart', as: 'restart'

  # Contact
  get '/contact', to: 'contact#new', as: 'contacts'
  post '/contact', to: 'contact#contact_send', as: 'contact'
  
  # Goals
  get '/goals', to: 'goals#index', as: 'goals'
  get '/goals/new', to: 'goals#new', as: 'new_goal'
  post '/goals', to: 'goals#create'
  get '/goals/:id', to: 'goals#show', as: 'goal'
  patch '/goals/:id', to: 'goals#add'
end


EverestApp::Application.routes.draw do
  resources :users
  resources :goals

  root :to => "sessions#new"

  get "/about" => "users#about"

  get '/login', :to => 'sessions#new', :as => :login
  get '/auth/:provider/callback', :to => 'sessions#create'
  # get '/auth/failure', :to => 'sessions#failure'
end
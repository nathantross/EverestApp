EverestApp::Application.routes.draw do
  resources :users
  resources :goals

  root :to => "sessions#new"

  get "/about" => "users#about"

  get '/auth/:provider/callback', :to => 'sessions#create'

  get '/logout', :to => 'sessions#destroy'

end
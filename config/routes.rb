EverestApp::Application.routes.draw do
  resources :users
  resources :goals

  root :to => "sessions#new"

  get "/about" => "users#about"

  get '/auth/:provider/callback', :to => 'sessions#create'
<<<<<<< HEAD
  # get '/auth/failure', :to => 'sessions#failure'
=======
  get '/logout', :to => 'sessions#destroy'

>>>>>>> 527298e70cfb9800eacf814d7e4c4ad572561f95
end
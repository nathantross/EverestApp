EverestApp::Application.routes.draw do

# root :to "sessions#new"
  get "user/index"
  get "goal/index"
  get "goal/new"
  get "goal/create"
  get "goal/show"
  get "goal/edit"
  get "goal/update"
  get "goal/delete"

  resources :users
  resources :goals


  root :to => "sessions#new"


get '/login', :to => 'sessions#new', :as => :login
get '/auth/:provider/callback', :to => 'sessions#create'
get '/auth/failure', :to => 'sessions#failure'
get '/logout', :to => 'sessions#destroy'

end

EverestApp::Application.routes.draw do
  root to: "sessions#new"


  get   '/login', :to => 'sessions#new', :as => :login
  get '/auth/:provider/callback', :to => 'sessions#create'
  get '/auth/failure', :to => 'sessions#failure'
  get '/logout', :to => 'sessions#destroy'

end

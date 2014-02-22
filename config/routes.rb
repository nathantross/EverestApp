EverestApp::Application.routes.draw do
<<<<<<< HEAD
  root to: "sessions#new"
=======
  root :to => "sessions#new"
  get "user/index"
  get "goal/index"
  get "goal/new"
  get "goal/create"
  get "goal/show"
  get "goal/edit"
  get "goal/update"
  get "goal/delete"
>>>>>>> 6f727c9678e8b98a10762a4d3d58abf4357e77ed


  get   '/login', :to => 'sessions#new', :as => :login
  get '/auth/:provider/callback', :to => 'sessions#create'
  get '/auth/failure', :to => 'sessions#failure'
  get '/logout', :to => 'sessions#destroy'

end

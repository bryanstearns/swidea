ActionController::Routing::Routes.draw do |map|

  map.resources :ideas do |idea|
    idea.resources :tasks
  end
  map.resources :tasks
  map.resources :skills
  map.resources :pages
  map.resources :users

  map.resource :session, :controller => 'sessions'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.login  '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'

  map.root :controller => "welcome"
end

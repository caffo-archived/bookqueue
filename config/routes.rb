ActionController::Routing::Routes.draw do |map|
  map.resource :session, :controller => 'sessions'

  map.home '', :controller => 'books'
  map.rss '/rss/', :controller => 'books', :action => 'rss'

  map.resources :books
  map.resources :users
  map.resource  :session
  
  map.connect ':controller/service.wsdl', :action => 'wsdl'
  map.connect ':controller/:action/:id.:format'
  map.connect ':controller/:action/:id'
end

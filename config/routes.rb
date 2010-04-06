ActionController::Routing::Routes.draw do |map|
  map.calendar '/calendar/:year/:month', :controller => 'calendar', :action => 'index', :year => Time.zone.now.year, :month => Time.zone.now.month
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.resources :users

  map.resource :session




  # Sample resource route within a namespace:
     map.namespace :admin do |admin|
       # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
       admin.resources :pages
			
			 admin.resources :events
			 admin.calendar '/events/:year/:month', :controller => 'events', :action => 'index', :year => Time.zone.now.year, :month => Time.zone.now.month      
	     admin.root :controller=>"overview"	
     end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.view_page ':name', :controller => 'viewer', :action => 'show'

  map.root :controller => "viewer", :action=>"show", :name => 'home'

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

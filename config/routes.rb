ActionController::Routing::Routes.draw do |map|
  #forms
  map.advertise "/about/advertise", :controller =>"contact", :action => "advertise"
  map.work "/about/work", :controller =>"contact", :action => "work"
  
  #digital mag
  map.issuu_index '/magazine/issues', :controller => "issuu", :action=>"index"
  map.issuu_show '/issuu/:publication_name/:number', :controller => "issuu", :action=>"show"
  #rss feeds
	map.ads '/rss/ads/:client_id', :controller => 'rss',:action => "ads"
	map.service_ads '/rss/ads/:client_id/:side/', :controller => 'rss',:action => "service_ads"
	
	map.calendar '/calendar/:year/:month', :controller => 'calendar', :action => 'index', :year => Time.zone.now.year, :month => Time.zone.now.month
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
	map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate', :activation_code => nil
  
  map.resources :users

  map.resource :session
	map.resources :rss 



  # Sample resource route within a namespace:
     map.namespace :admin do |admin|
       # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
       admin.resources :pages
 			 admin.resources :locations
 			 admin.resources :locationtypes
			 admin.resources :posts
	  	 admin.resources :users	
	  	 admin.resources :roles	
	  	 admin.resources :classifieds
 	  	 admin.resources :clients, :has_many => :ads
 	  	 admin.resources :clients, :has_many => :service_ads
			 admin.resources :events, :has_many => :egalleries
			 admin.resources :event_types
  		 admin.resources :egalleries, :has_many => :uploads
	

			 admin.calendar 'events/:year/:month', :controller => 'events', :action => 'index', :year => Time.zone.now.year, :month => Time.zone.now.month      
	     admin.root :controller=>"overview"	
     end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.view_page ':name', :controller => 'viewer', :action => 'show'

  map.whatson_filter '/whatson/:type/:filter', :controller => 'viewer', :action => "show", :name =>"whatson"
  map.classified_filter '/classified/:filter', :controller => 'viewer', :action => "show", :name =>"classified"
  
  map.food_review 'food/reviews/:title', :controller => 'viewer', :action => "show", :name =>"food"
  map.root :controller => "viewer", :action=>"show", :name => 'home'

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

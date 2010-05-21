class ViewerController < ApplicationController
  include Geokit::Geocoders
  
  def show
		@page = Page.find_by_name(params[:name])
		@news = Post.find_sub(3)
		@issue = Issue.find(:first, :order => "created_at desc")
		if @page.name == "classified"
			@events = Event.find(:all, :order =>"start_at asc", :conditions => ["start_at = ?",Date.today], :include => "location")
			if params[:filter]

            title = params[:filter].gsub(/-/," ").capitalize
    		    @classified_type = Classified.find_by_title(title)
    		    @classifieds = @classified_type.subclassifieds.paginate :page => params[:page],:per_page => 6

			else
			  @classifieds = Classified.find_all_sub
		  end
		end
		if @page.name == "whatson"
		  @today = Event.find(:all, :order =>"start_at asc", :conditions => ["start_at = ?",Date.today], :include => "location")
		  if params[:type] and params[:filter]
        if params[:type] == "events"
          title = params[:filter].gsub(/-/," ").capitalize
  		    @event_type = EventType.find_by_title(title)
  		    @events = @event_type.events
  		    @events.delete_if{|d| d.start_at < Date.today }
  		    @events = @events.sort_by(&:start_at).paginate :page => params[:page],:per_page => 6
        else    
          title = params[:filter].gsub(/-/," ").capitalize
          @location_type = LocationType.find_by_title(title)
          @locations = @location_type.locations.paginate :page => params[:page],:per_page => 6
        end  
		  else
		    @events = Event.find(:all, :order =>"start_at asc", :conditions => ["start_at >= ?",Date.today], :include => "location").paginate :page => params[:page],:per_page => 6
		  end
			
		end
		if @page.name == "home"
			@articles = Post.find_sub(2).paginate :page => 1,:per_page => 3
			@events = Event.find(:all, :order =>"start_at asc", :conditions => ["start_at = ?",Date.today], :include => "location")
			@classifieds = Classified.find_all_sub
		end
		if @page.name == "about"
		  @events = Event.find(:all, :order =>"start_at asc", :conditions => ["start_at = ?",Date.today], :include => "location")
		  	@res=GoogleGeocoder.geocode("Calle Frailes, 27. Granada. Spain")    
  			if @res.success
  				@lng = @res.lng
  				@lat = @res.lat
  			end

  			@map = GMap.new("map")
  			@map.control_init(:large_map => true,:map_type => true)
  			@map.center_zoom_init([@lat,@lng],14)
  			@map.overlay_init(GMarker.new([@lat,@lng],:info_window => "Add: Calle Frailes, 27. Granada. Spain<br/>Tlf: +34958269334"))
	  end
		if @page.name == "magazine"
			@articles = Post.find_all_sub.delete_if{|f| f.parent_id == 11}.paginate :page => params[:page],:per_page => 6
			@events = Event.find(:all, :order =>"start_at asc", :conditions => ["start_at = ?",Date.today], :include => "location")
			@articles.delete_if{|f| f.parent_id == 11}
		end
		if @page.name == "food"
		  if params[:title]
		    @review = Post.find_by_title(params[:title].gsub(/_/, " "))
		  else
		  
  			@reviews = Post.find_sub(11)
		  end
		    @events = Event.find(:all, :order =>"start_at asc", :conditions => ["start_at = ?",Date.today], :include => "location")
			
		end
		if @page.metatag
  		set_meta_tags :title => @page.metatag.title,
                      :description => @page.metatag.description,
                      :keywords => @page.metatag.keywords
    else
      set_meta_tags :title => @page.title,
                      :description => 'Testing the viewer',
                      :keywords => @page.title

  		      
		end
  end

end

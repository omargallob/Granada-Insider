class ViewerController < ApplicationController
  def show
		@page = Page.find_by_name(params[:name])
		if @page.name == "whatson"
		  if params[:type] and params[:filter]
        if params[:type] == "events"
          title = params[:filter].gsub(/-/," ").capitalize
  		    @event_type = EventType.find_by_title(title)
  		    @events = @event_type.events.sort_by(&:start_at).paginate :page => params[:page],:per_page => 6
        else 
          title = params[:filter].gsub(/-/," ").capitalize
          @location_type = LocationType.find_by_title(title)
          @locations = @location_type.locations.paginate :page => params[:page],:per_page => 6
        end  
		  else
		    @events = Event.find(:all, :order =>"start_at asc", :conditions => ["start_at > ?",Time.now], :include => "location").paginate :page => params[:page],:per_page => 6
		  end
			
		end
		if @page.name == "home"
			@articles = Post.find_sub(2).paginate :page => 1,:per_page => 3
			@events = Event.find(:all, :order =>"start_at asc", :conditions => ["end_at < ? and start_at > ?",Time.now + 1.day,Time.now - 1.day], :include => "location")
			@classifieds = Classified.find_all_sub
		end
		if @page.name == "magazine"
			@articles = Post.find_all_sub.paginate :page => params[:page],:per_page => 6
			@events = Event.find(:all, :order =>"start_at asc", :conditions => ["end_at < ? and start_at > ?",Time.now + 1.day,Time.now - 1.day], :include => "location")
		end
		if @page.name == "food"
			@events = Event.find(:all, :order =>"start_at asc", :conditions => ["end_at < ? and start_at > ?",Time.now + 1.day,Time.now - 1.day], :include => "location")
			@reviews = Post.find_sub(11)
		end
		if @page.name == "classified"
			@events = Event.find(:all, :order =>"start_at asc", :conditions => ["end_at < ? and start_at > ?",Time.now + 1.day,Time.now - 1.day], :include => "location")
			@classifieds = Classified.find_all_sub
		end
  end

end

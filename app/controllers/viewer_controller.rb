class ViewerController < ApplicationController
  def show
		@page = Page.find_by_name(params[:name])
		@news = Post.find_sub(3).paginate :page => 1,:per_page => 1
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
		  if params[:type] and params[:filter]
        if params[:type] == "events"
          title = params[:filter].gsub(/-/," ").capitalize
  		    @event_type = EventType.find_by_title(title)
  		    @events = @event_type.events
  		    @events.delete_if{|d| d.start_at < Time.now }
  		    @events = @events.sort_by(&:start_at).paginate :page => params[:page],:per_page => 6
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
			@events = Event.find(:all, :order =>"start_at asc", :conditions => ["start_at = ?",Date.today], :include => "location")
			@classifieds = Classified.find_all_sub
		end
		if @page.name == "magazine"
			@articles = Post.find_all_sub.paginate :page => params[:page],:per_page => 6
			@events = Event.find(:all, :order =>"start_at asc", :conditions => ["start_at = ?",Date.today], :include => "location")
		end
		if @page.name == "food"
		  if params[:title]
		    @review = Post.find_by_title(params[:title].gsub(/_/, " "))
		  else
		  
  			@reviews = Post.find_sub(11)
		  end
		    @events = Event.find(:all, :order =>"start_at asc", :conditions => ["start_at = ?",Date.today], :include => "location")
			
		end
  end

end

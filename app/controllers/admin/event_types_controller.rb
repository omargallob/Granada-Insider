class Admin::EventTypesController < Admin::BaseController
 def index
		@types = EventType.find(:all)
 end

 def new
 	@event_type = LocationType.new
 end

end

class Admin::EventTypesController < Admin::BaseController
 def index
		@types = EventType.find(:all)
 end

 def new
 	@event_type = LocationType.new
 end

 def create
    @event_type = EventType.new(params[:event_type])

 	 respond_to do |format|
 		 if @event_type.save
 		   flash[:notice] = 'Role was successfully created.'
 		   format.html {

 		       flash[:notice] = 'Role was successfully created.'
 		       redirect_to(admin_event_types_path)


 		    }

 		   format.xml  { render :xml => @event_type, :status => :created, :event => @event_type }
 		 else
 		   format.html { render :action => "new" }
 		   format.xml  { render :xml => @event_type.errors, :status => :unprocessable_entity }
 		 end
 	 end
 end
 def destroy
   @event_type = EventType.find(params[:id])
   @event_type.destroy

   respond_to do |format|
     format.html { redirect_to(admin_event_types_path) }
     format.xml  { head :ok }
   end
 end
end

class Admin::EventsController < Admin::BaseController

  def index
		@events = Event.find(:all, :order => "start_at asc")
  end
	def new
		@events = Event.new
	end
	def create
	 @event = Event.new(params[:event])

	 respond_to do |format|
		 if @event.save
		  
		   format.html {
		     
		       flash[:notice] = 'Event was successfully created.'
		       redirect_to(admin_event_path(@event))
		     
		     
		    }
		  
		   format.xml  { render :xml => @event, :status => :created, :location => @event }
		 else
		   format.html { render :action => "new" }
		   format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
		 end
	 end
	end

	def show
			@event = Event.find_by_id(params[:id])	
	end

	def edit
		@event = Event.find_by_id(params[:id])
	end	
   # PUT /events/1
   # PUT /events/1.xml
   def update
     @event = Event.find(params[:id])
	   @events = Event.find(:all)
     respond_to do |format|
       if @event.update_attributes(params[:event])
        format.html {

             flash[:notice] = 'Event was successfully updated.'
             redirect_to :action => "index"
          
          }
        format.xml  { head :ok }
       else
         format.html { render :action => "edit" }
         format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
       end
     end
   end

   # DELETE /events/1
   # DELETE /events/1.xml
   def destroy
     @event = Event.find(params[:id])
     @event.destroy

     respond_to do |format|
       format.html { redirect_to(admin_events_path) }
       format.xml  { head :ok }
     end
   end
end

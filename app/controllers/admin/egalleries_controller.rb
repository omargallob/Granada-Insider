class Admin::EgalleriesController < Admin::BaseController
  def index
		@event = Event.find_by_id(params[:event_id])
		@egalleries = @event.egalleries
  end

  def show
		@egallery = Egallery.find_by_id(params[:id])
  end

  def new
		@event = Event.find_by_id(params[:event_id])
		@egallery = Egallery.new
  end

	def create
	 @egallery = Egallery.new(params[:egallery])
	 respond_to do |format|
		 if @egallery.save
			
			 format.html {
			   
			     flash[:notice] = 'Event Gallery was successfully created.'
			     redirect_to admin_event_egalleries_path(@egallery.event.id)
			   
			   
			  }
			
			 format.xml  { render :xml => @egallery, :status => :created, :egallery => @egallery }
		 else
			 format.html { render :action => "new" }
			 format.xml  { render :xml => @egallery.errors, :status => :unprocessable_entity }
		 end
	 end
	end

  def edit
		@event = Event.find_by_id(params[:event_id])
		@egallery = Egallery.find_by_id(params[:id])
  end

	 def destroy
     @egallery = Egallery.find(params[:id])
     @egallery.destroy

     respond_to do |format|
       format.html { redirect_to(admin_event_egalleries_path(@egallery.event)) }
       format.xml  { head :ok }
     end
   end
end

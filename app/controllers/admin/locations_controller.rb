class Admin::LocationsController < Admin::BaseController
  def index
		@locations = Location.find(:all)
  end

  def new
		@location = Location.new
  end

	def create
	 @location = Location.new(params[:location])

	 respond_to do |format|
		 if @location.save
			 flash[:notice] = 'location was successfully created.'
			 format.html {
			   
			     flash[:notice] = 'Category was successfully created.'
			     redirect_to(admin_location_path(@location))
			   
			   
			  }
			
			 format.xml  { render :xml => @location, :status => :created, :location => @location }
		 else
			 format.html { render :action => "new" }
			 format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
		 end
	 end
	end


  def edit
		@location = Location.find_by_id(params[:id])
  
     respond_to do |format|
       if @location.update_attributes(params[:location])
        flash[:notice] = 'Location was successfully UPDATED.'
        format.html {
           
             flash[:notice] = 'Location was successfully updated.'
             redirect_to(admin_location_path(@location))
          
          }
        format.xml  { head :ok }
       else
         format.html { render :action => "edit" }
         format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
       end
     end
  end

   # DELETE /locations/1
   # DELETE /locations/1.xml
   def destroy
     @location = Location.find(params[:id])
     @location.destroy

     respond_to do |format|
       format.html { redirect_to(admin_locations_path) }
       format.xml  { head :ok }
     end
   end

  def show
		@location = Location.find_by_id(params[:id])
  end

end

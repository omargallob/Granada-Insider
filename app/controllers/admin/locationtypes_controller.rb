class Admin::LocationtypesController < Admin::BaseController
  def index
		@types = LocationType.find(:all)
  end

  def new
  	@location_type = LocationType.new
  end

  def create
     @location_type = LocationType.new(params[:location_type])

  	 respond_to do |format|
  		 if @location_type.save
  		   flash[:notice] = 'Role was successfully created.'
  		   format.html {

  		       flash[:notice] = 'Role was successfully created.'
  		       redirect_to(admin_locationtypes_path)


  		    }

  		   format.xml  { render :xml => @location_type, :status => :created, :location => @location_type }
  		 else
  		   format.html { render :action => "new" }
  		   format.xml  { render :xml => @location_type.errors, :status => :unprocessable_entity }
  		 end
  	 end
  end
  def destroy
    @location_type = LocationType.find(params[:id])
    @location_type.destroy

    respond_to do |format|
      format.html { redirect_to(admin_locationtypes_path) }
      format.xml  { head :ok }
    end
  end
  def edit
    @location = LocationType.find_by_id(params[:id])
  end
  def update
 		@location = LocationType.find_by_id(params[:id])
     respond_to do |format|
       if @location.update_attributes(params[:location_type])
        flash[:notice] = 'EventType was successfully UPDATED.'
        format.html {

             flash[:notice] = 'EventType was successfully updated.'
             redirect_to(admin_locationtypes_path)

          }
        format.xml  { head :ok }
       else
         format.html { render :action => "edit" }
         format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
       end
     end
  end
end

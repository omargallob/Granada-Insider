class Admin::UploadsController < ApplicationController

	def	create
	 @upload = TempUpload.new(params[:upload])

 	 @egallery = Egallery.find_by_id(params[:egallery_id])
	 @upload.egallery_id = @egallery.id			
		respond_to do |format|
    	if @upload.save
			
	    @upload.queue_move_to_s3

			
			 format.html {
			   
			     flash[:notice] = 'Event Gallery was successfully created.'
			     redirect_to admin_event_egallery_path(@egallery.event.id,@egallery.id)
			   
			   
			  }
			
			 format.xml  { render :xml => @upload, :status => :created, :upload => @upload }
		 else
			 format.html { render :action => "new" }
			 format.xml  { render :xml => @upload.errors, :status => :unprocessable_entity }
		 end
	 end
	end 

 def destroy
     @upload = Upload.find(params[:id])
     @upload.destroy

     respond_to do |format|
       format.html { redirect_to(admin_event_egallery_path(@upload.egallery.event,@upload.egallery)) }
       format.xml  { head :ok }
     end
   end
end

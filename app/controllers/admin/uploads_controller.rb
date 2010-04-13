class Admin::UploadsController < ApplicationController

	def	create
	 @upload = Upload.new(params[:upload])
 	 @upload.egallery_id = params[:egallery_id]
		respond_to do |format|
		 if @upload.save
			
			 format.html {
			   
			     flash[:notice] = 'Event Gallery was successfully created.'
			     redirect_to admin_event_egallery_path(@upload.egallery.event.id,@upload.egallery.id)
			   
			   
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

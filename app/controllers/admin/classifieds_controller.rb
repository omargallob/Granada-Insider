class Admin::ClassifiedsController < Admin::BaseController
  def index
		@classifieds = Classified.find_main
  end

  def new
		@classified = Classified.new
  end
	
	def create
    @classified = Classified.new(params[:classified])

      if @classified.save
		   redirect_to( admin_classifieds_path) 
      else
        render :action => "new"
      end
    
	end

  def edit
	 @classified = Classified.find_by_id(params[:id])
  end

  def show
	 @parent = Classified.find_by_id(params[:id])
	 @classifieds = @parent.subclassifieds
  end


	def update
			      @classified = Classified.find_by_id(params[:id])
       respond_to do |format|
         if @classified.update_attributes(params[:classified])
           format.html { 
         		   flash[:notice] = 'classified was successfully updated.'
               redirect_to( admin_classifieds_path) 
           }
					 format.xml  { head :ok }

               
            
          
          
         else
           format.html { render :action => "edit" }
           format.xml  { render :xml => @classified.errors, :status => :unprocessable_entity }
         end
       end
	end

	def destroy

	 @classified = Classified.find_by_id(params[:id])
	 @classified.destroy

	 respond_to do |format|
		 format.html { redirect_to(admin_classified_path) }
		 format.xml  { head :ok }
	 end
	end

end

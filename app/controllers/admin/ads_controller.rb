class Admin::AdsController <  Admin::BaseController
  def index
		@parent = Client.find_by_id(params[:client_id])
		@ads = @parent.ads
  end

  def show
  end

  def edit
		@parent = Client.find_by_id(params[:client_id])
		@ad = Ad.find_by_id(params[:id])
  end

  def new
		@parent = Client.find_by_id(params[:client_id])
		@ad = Ad.new
  end
	def create
		  @ad = Ad.new(params[:ad])

		    if @ad.save
				 redirect_to( admin_client_ads_path(@ad.client.id) )
		    else
		      render :action => "new"
		    end
		  
		end

	def update
		@ad = Ad.find_by_id(params[:id])
		respond_to do |format|
		 if @ad.update_attributes(params[:ad])
			 format.html { 
		 		   flash[:notice] = 'ad was successfully updated.'
				   redirect_to( admin_client_ads_path(@ad.client) )
			 }
			 format.xml  { head :ok }
		 else
			 format.html { render :action => "edit" }
			 format.xml  { render :xml => @ad.errors, :status => :unprocessable_entity }
		 end
		end
	end
	def destroy

	 @ad = Ad.find_by_id(params[:id])
	 @ad.destroy

	 respond_to do |format|
		 format.html { redirect_to(admin_client_ads_path(@ad.client)) }
		 format.xml  { head :ok }
	 end
	end
end

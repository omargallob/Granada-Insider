class Admin::ServiceAdsController < Admin::BaseController
  def index
		@parent = Client.find_by_id(params[:client_id])
		@ads = @parent.service_ads
  end

  def new
		@parent = Client.find_by_id(params[:client_id])
		@ad = ServiceAd.new
  end
  
  def create
    @ad = ServiceAd.new(params[:service_ad])

    if @ad.save
     redirect_to( admin_client_service_ads_path(@ad.client.id) )
    else
      render :action => "new"
    end
  end

  def show
  end
  
  def edit
  end
	def destroy

	 @ad = ServiceAd.find_by_id(params[:id])
	 @ad.destroy

	 respond_to do |format|
		 format.html { redirect_to(admin_client_service_ads_path(@ad.client)) }
		 format.xml  { head :ok }
	 end
	end
end

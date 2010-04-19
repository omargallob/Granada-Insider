class Admin::ClientsController < Admin::BaseController
  def index
		@clients = Client.find_main
  end

  def new
		@client = Client.new
  end
	
	def create
    @client = Client.new(params[:client])

      if @client.save
		   redirect_to( admin_clients_path) 
      else
        render :action => "new"
      end
    
	end

  def edit
	 @client = Client.find_by_id(params[:id])
  end

  def show
	 @parent = Client.find_by_id(params[:id])
	 @clients = @parent.subclients
  end


	def update
		@client = Client.find_by_id(params[:id])
		respond_to do |format|
		 if @client.update_attributes(params[:client])
			 format.html { 
		 		   flash[:notice] = 'client was successfully updated.'
				   redirect_to( admin_clients_path) 
			 }
			 format.xml  { head :ok }

				   
				
		
		
		 else
			 format.html { render :action => "edit" }
			 format.xml  { render :xml => @client.errors, :status => :unprocessable_entity }
		 end
		end
	end

	def destroy

	 @client = Client.find_by_id(params[:id])
	 @client.destroy

	 respond_to do |format|
		 format.html { redirect_to(admin_client_path) }
		 format.xml  { head :ok }
	 end
	end

end


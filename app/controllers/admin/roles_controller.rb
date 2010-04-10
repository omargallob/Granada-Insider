class Admin::RolesController < Admin::BaseController
  def index
		@roles = Role.find(:all)
  end
	def new
		@roles = Role.new
	end
	def create
	 @role = Role.new(params[:role])

	 respond_to do |format|
		 if @role.save
		   flash[:notice] = 'Role was successfully created.'
		   format.html {
		     
		       flash[:notice] = 'Role was successfully created.'
		       redirect_to(admin_roles_path)
		     
		     
		    }
		  
		   format.xml  { render :xml => @role, :status => :created, :location => @role }
		 else
		   format.html { render :action => "new" }
		   format.xml  { render :xml => @role.errors, :status => :unprocessable_entity }
		 end
	 end
	end

end

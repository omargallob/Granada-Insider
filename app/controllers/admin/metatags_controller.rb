class Admin::MetatagsController < Admin::BaseController
 
  def index
 		@metatags = Metatag.find(:all)
   end

   def new
    @page = Page.find_by_id(params[:parent])
 		@metatag = Metatag.new
   end

 	def create
 	 @metatag = Metatag.new(params[:metatag])

 	 respond_to do |format|
 		 if @metatag.save
 			 flash[:notice] = 'metatag was successfully created.'
 			 format.html {

 			     flash[:notice] = 'Category was successfully created.'
 			     redirect_to(admin_metatag_path(@metatag))


 			  }

 			 format.xml  { render :xml => @metatag, :status => :created, :metatag => @metatag }
 		 else
 			 format.html { render :action => "new" }
 			 format.xml  { render :xml => @metatag.errors, :status => :unprocessable_entity }
 		 end
 	 end
 	end

  def edit
    @meta = Metatag.find_by_id(params[:id])
    @page = @meta.page
  end

  def show
  end

end

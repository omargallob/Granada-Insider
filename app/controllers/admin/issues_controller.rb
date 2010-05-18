class Admin::IssuesController < Admin::BaseController
  def index
    @issues = Issue.find(:all, :order => "created_at desc")
  end

  def show
    @issue = Issue.find_by_id(params[:id])
  end


  def new
     @issue = Issue.new
  end
  
  def create
   @issue = Issue.new(params[:issue])

	 respond_to do |format|
		 if @issue.save
			 flash[:notice] = 'An issue was successfully created.'
			 format.html {

			     flash[:notice] = 'Category was successfully created.'
			     redirect_to(admin_issues_path)


			  }

			 format.xml  { render :xml => @issue, :status => :created, :issue => @issue }
		 else
			 format.html { render :action => "new" }
			 format.xml  { render :xml => @issue.errors, :status => :unprocessable_entity }
		 end
	 end
  end

  def edit
    @issue = Issue.find_by_id(params[:id])
  end
  
  def update
    	@issue = Issue.find_by_id(params[:id])
       respond_to do |format|
         if @issue.update_attributes(params[:issue])
          flash[:notice] = 'Issue was successfully UPDATED.'
          format.html {

               flash[:notice] = 'Issue was successfully updated.'
               redirect_to(admin_issues_path)

            }
          format.xml  { head :ok }
         else
           format.html { render :action => "edit" }
           format.xml  { render :xml => @issue.errors, :status => :unprocessable_entity }
         end
       end
  end
  def destroy
     @issue = Issue.find(params[:id])
     @issue.destroy

     respond_to do |format|
       format.html { redirect_to(admin_issues_path) }
       format.xml  { head :ok }
     end
   end
  
end

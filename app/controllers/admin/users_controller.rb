class Admin::UsersController < Admin::BaseController
  def index
		@users = User.find(:all)
  end

  def new
		@user = User.new
  end
	def create
    logout_keeping_session!
    @user = User.new(params[:user])
    success = @user && @user.save
    if success && @user.errors.empty?
      redirect_to admin_users_path
      flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
    else
      flash[:error]  = "We couldn't set up that account, sorry.  Please try again, or contact an admin (link is above)."
      render :action => 'new'
    end
	end

  def edit
  end

end

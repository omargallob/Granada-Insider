class Admin::OverviewController < Admin::BaseController
  def index
		@pages = Page.find(:all)
		@events = Event.find(:all)
		@locations = Location.find(:all)
		@users = User.find(:all)
		@roles = Role.find(:all)
  end

end

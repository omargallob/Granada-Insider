class ViewerController < ApplicationController
  def show
		@page = Page.find_by_name(params[:name])
		if @page.name == "whatson"
			@events = Event.find(:all, :order =>"start_at asc", :conditions => ["start_at > ?",Time.now], :include => "location").paginate :page => params[:page],:per_page => 6
		end
		if @page.name == "home"
			@articles = Post.find_sub(2)
			@events = Event.find(:all, :order =>"start_at asc", :conditions => ["end_at < ? and start_at > ?",Time.now + 1.day,Time.now - 1.day], :include => "location")
			@classifieds = Classified.find_all_sub
		end
  end

end

class ViewerController < ApplicationController
  def show
		@page = Page.find_by_name(params[:name])
		if @page.name == "whatson"
			@events = Event.find(:all, :order =>"start_at asc", :conditions => ["start_at > ?",Time.now], :include => "location")
		end
  end

end

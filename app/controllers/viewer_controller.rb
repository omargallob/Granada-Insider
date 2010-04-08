class ViewerController < ApplicationController
  def show
		@page = Page.find_by_name(params[:name])
		if @page.name == "whatson"
			@events = Event.find(:all, :order =>"start_at desc")
		end
  end

end

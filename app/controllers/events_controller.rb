class EventsController < ApplicationController
  def show
    @page = Page.find_by_name("whatson")
    @news = Post.find_sub(3).paginate :page => 1,:per_page => 1
    @events = Event.find(:all, :order =>"start_at asc", :conditions => ["start_at = ?",Date.today], :include => "location")
    @event = Event.find_by_id(params[:id])
    @issue = Issue.find(:first, :order => "created_at desc")
		
		@events_at_location = @event.location.events 
		@events_at_location.delete_if{|x| x.id == @issue.id}
  end

end

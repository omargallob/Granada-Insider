class IssuuController < ApplicationController
  def index
    @page = Page.find_by_name("magazine")
    @news = Post.find_sub(3).paginate :page => 1,:per_page => 1
    @events = Event.find(:all, :order =>"start_at asc", :conditions => ["start_at = ?",Date.today], :include => "location")
  			
  end

  def show
    @page = Page.find_by_name("magazine")
  end

end

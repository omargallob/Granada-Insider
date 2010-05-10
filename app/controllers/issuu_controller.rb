class IssuuController < ApplicationController
  def index
    @page = Page.find_by_name("magazine")
    @news = Post.find_sub(3).paginate :page => 1,:per_page => 1
		    
  end

  def show
    @page = Page.find_by_name("magazine")
  end

end

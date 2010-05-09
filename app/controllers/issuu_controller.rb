class IssuuController < ApplicationController
  def index
    @page = Page.find_by_name("magazine")    
  end

  def show
    @page = Page.find_by_name("magazine")
  end

end

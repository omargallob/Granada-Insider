class ContactController < ApplicationController
  def advertise
    @page = Page.find_by_name("about")
  end

  def work
    @page = Page.find_by_name("about")
    
  end

end

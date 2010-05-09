class ContactController < ApplicationController
  def advertise
    @page = Page.find_by_name("about")
      @contact = Contact.new
  end

  def work
    @page = Page.find_by_name("about")
    @contact = Contact.new
  end
  
  def create
    contact = Contact.new(params[:contact])
    if contact.save
	   redirect_to  :action => "notify"
    else
      redirect_to :action => "work"
    end

  end

  def notify
      @page = Page.find_by_name("about")

  end
end

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
	   redirect_to  :action => "notify", :contact_id => contact.id
    else

      redirect_to :action => "work"
    end

  end

  def notify
      @page = Page.find_by_name("about")
      contact = Contact.find_by_id(params[:contact_id])
      ContactMailer.deliver_contact_notification(contact)
      ContactMailer.deliver_system_notification(contact)    
  end
end

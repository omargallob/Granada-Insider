class ContactMailer < ActionMailer::Base
  def contact_notification(contact)
    setup_email(contact)
    @subject    += 'Thank you for contacting us'
    @body[:contact]  = contact
  end
  
  def system_notification(contact)
     system_email_setup(contact)
     @subject     = "contact - #{contact.type}"     
     @body[:contact] = contact
  end
  
  protected
     def setup_email(contact)
       @recipients  = "#{contact.email}"
       @from        = "system@granadainsider.com"
       @subject     = "Granada Insider - Online Magazine "
       @sent_on     = Time.now
       @body[:contact] = contact
     end
     def system_email_setup(contact)
         @recipients  = "contact@granadainsider.com"
          @from        = "#{contact.email}"
          @sent_on     = Time.now
     end
end

class Contact < ActiveRecord::Base
   attr_accessible :email, :name, :comment, :job, :disponiblity, :type, :company, :telephone
   validates_format_of       :name,     :with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => true
   validates_length_of       :name,     :maximum => 100

   validates_presence_of     :email
   validates_length_of       :email,    :within => 6..100 #r@a.wk
   validates_uniqueness_of   :email
   validates_format_of       :email,    :with => Authentication.email_regex, :message => Authentication.bad_email_message
  

  
end

class Egallery < ActiveRecord::Base
 belongs_to :event
 has_many :uploads, :attributes =>true, :dependent => :destroy
end

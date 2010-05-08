class ServiceAd < ActiveRecord::Base

belongs_to :client

has_attached_file :photo,
		                :styles => {
		                  :pagesize => ["200x200#", :jpg],          :thumb => ["82x82#", :jpg],
		                },:processors => [:cropper],:convert_options => {  
		                    :thumb => "-resize 83x82 -gravity center", :pagesize => "-resize 200x200 -gravity center"
		              	},
		                :storage => :s3,
		                :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
		                :path => "assets/events/gallery/:id/:style/:basename.jpg"

	attr_accessor :crop_x, :crop_y, :crop_w, :crop_h     

	after_update  :reprocess_photo, :if => :cropping?

	def cropping?
	 !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
	end  

	def photo_geometry(style = :original)
	 @geometry ||= {}
	 @geometry[style] ||= Paperclip::Geometry.from_file(photo.to_file(style))
	end

	private
	 def reprocess_photo
		 photo.reprocess!
	 end
	 def reset_photo
		 photo.reprocess!
	 end
end

class Post < ActiveRecord::Base
	has_many :subposts, :class_name => 'Post', :foreign_key => 'parent_id'
  belongs_to :parent, :class_name => 'Post', :foreign_key => 'parent_id'


# functions
	def self.find_main
		Post.find(:all, :conditions => ['parent_id IS NULL'], :order => 'position')
	end

	def self.find_sub(pid)
		Post.find(:all, :conditions => ['parent_id = ?', pid], :order => 'date DESC')
	end

	def self.find_all_sub
		Post.find(:all, :conditions => ['parent_id > 0'], :order => 'date DESC')
	end

	has_attached_file :photo,
		                :styles => {
		                  :pagesize => ["621x374#", :jpg],          :thumb => ["82x82#", :jpg],
		                },:processors => [:cropper],:convert_options => {  
		                    :thumb => "-resize 83x82 -gravity center"
		              	},
		                :storage => :s3,
		                :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
		                :path => "assets/posts/:id/:style/:basename.jpg"
	                
	attr_accessor :crop_x, :crop_y, :crop_w, :crop_h     



	# before_edit :reset_photo
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

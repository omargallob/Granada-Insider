class TempUpload < Upload
 has_attached_file :photo, :path => "#{RAILS_ROOT}/tmp/uploads/:id/:basename.:extension"

	def queue_move_to_s3
	  self.send_later(:perform)
	end

	def perform
		upload = Upload.find(self.id) # This is the same db record as self
		upload.photo = self.photo.to_file
		upload.processing = false
		upload.save!  # This will re-upload & re-size your image as per your has_attached_file method in Upload
		path = self.photo.path
		self.photo.to_file.close
		File.delete(path)
	end
end

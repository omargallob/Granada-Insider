xml.instruct!
xml.services do
 
    
		 @category.subclients.each do |client|

				 client.ads.each do |ad|
					xml.advert do
					xml.image ad.photo.url(:pagesize)
					xml.link "/client/"+ad.client_id.to_s
					end
				 end
			end	
end


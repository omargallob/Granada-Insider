xml.instruct!
xml.services do
 
    
		 @category.subclients.each do |client|

				 client.service_ads.each do |ad|
				   if ad.side == params[:side]
					xml.advert do
					xml.image ad.photo.url(:pagesize)
					xml.link ad.client.link || "http://www.granadainsider.com/"
				    end
					end
				 end
			end	
end


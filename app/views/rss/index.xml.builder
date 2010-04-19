xml.instruct!
xml.clients do
   @client_cats.each do |category|
     xml.category  category.title
		 category.subclients.each do |client|
			xml.client do
				 xml.title client.title
				 client.ads.each do |ad|
					xml.image ad.photo.url(:thumb)
				 end
			end	
		 end 		
   end
end


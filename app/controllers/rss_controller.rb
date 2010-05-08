class RssController < ApplicationController
layout nil

  def index
		@client_cats = Client.find_main
		@client_cats.delete_if{|x| x.subclients.size == 0}
		 respond_to do |format|
          format.xml  #{ render :xml => @properties }
      end
  end

  def favs
     @favs = Page.find(:all, :conditions=>['featured=?',true])
      respond_to do |format|
          format.xml  #{ render :xml => @properties }
      end
  end

	def ads
		@category = Client.find_by_id(params[:client_id])
		 respond_to do |format|
          format.xml  #{ render :xml => @properties }
      end
	end
	def service_ads
		@category = Client.find_by_id(params[:client_id])
		@subs = @category.subclients
		 respond_to do |format|
          format.xml  #{ render :xml => @properties }
      end
	end
	
end

class Client < ActiveRecord::Base
	has_many :subclients, :class_name => 'Client', :foreign_key => 'parent_id'
  belongs_to :parent, :class_name => 'Client', :foreign_key => 'parent_id'

	has_many :ads
	belongs_to :location
# functions
	def self.find_main
		Client.find(:all, :conditions => ['parent_id IS NULL'], :order => 'position')
	end

	def self.find_sub(pid)
		Client.find(:all, :conditions => ['parent_id = ?', pid], :order => 'created_at DESC')
	end

	def self.find_all_sub
		Client.find(:all, :conditions => ['parent_id > 0'], :order => 'created_at DESC')
	end
end

class Classified < ActiveRecord::Base
	has_many :subclassifieds, :class_name => 'Classified', :foreign_key => 'parent_id'
  belongs_to :parent, :class_name => 'Classified', :foreign_key => 'parent_id'


# functions
	def self.find_main
		Classified.find(:all, :conditions => ['parent_id IS NULL'], :order => 'position')
	end

	def self.find_sub(pid)
		Classified.find(:all, :conditions => ['parent_id = ?', pid], :order => 'created_at DESC')
	end

	def self.find_all_sub
		Classified.find(:all, :conditions => ['parent_id > 0'], :order => 'created_at DESC')
	end
end

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
end

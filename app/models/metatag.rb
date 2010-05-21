class Metatag < ActiveRecord::Base
  belongs_to :page
  validates_uniqueness_of :title, :on => :create, :message => "must be unique"
end

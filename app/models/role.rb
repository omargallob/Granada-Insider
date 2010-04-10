class Role < ActiveRecord::Base
  has_and_belongs_to_many :users

  validates_presence_of     :name
  validates_length_of       :name,    :within => 3..40
  validates_uniqueness_of   :name
end

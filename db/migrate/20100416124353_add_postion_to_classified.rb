class AddPostionToClassified < ActiveRecord::Migration
  def self.up
    add_column :classifieds, :position, :integer
  end

  def self.down
    remove_column :classifieds, :position
  end
end

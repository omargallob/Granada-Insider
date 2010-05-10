class AddExtraToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :publication_name, :string
    add_column :posts, :page_number, :integer
  end

  def self.down
    remove_column :posts, :page_number
    remove_column :posts, :publication_name
  end
end

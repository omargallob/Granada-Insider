class AddTitleToClient < ActiveRecord::Migration
  def self.up
    add_column :clients, :title, :string
  end

  def self.down
    remove_column :clients, :title
  end
end

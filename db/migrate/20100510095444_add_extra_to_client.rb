class AddExtraToClient < ActiveRecord::Migration
  def self.up
    add_column :clients, :link, :string
  end

  def self.down
    remove_column :clients, :link
  end
end

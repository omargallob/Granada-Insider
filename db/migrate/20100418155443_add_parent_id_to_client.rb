class AddParentIdToClient < ActiveRecord::Migration
  def self.up
    add_column :clients, :parent_id, :integer
  end

  def self.down
    remove_column :clients, :parent_id
  end
end

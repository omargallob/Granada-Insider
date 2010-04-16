class AddProcessingToUpload < ActiveRecord::Migration
  def self.up
    add_column :uploads, :processing, :boolean, :default => true
  end

  def self.down
    remove_column :uploads, :processing
  end
end

class CreateTempUploads < ActiveRecord::Migration
  def self.up
    create_table :temp_uploads do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :temp_uploads
  end
end

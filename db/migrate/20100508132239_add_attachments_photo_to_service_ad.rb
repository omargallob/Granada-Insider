class AddAttachmentsPhotoToServiceAd < ActiveRecord::Migration
  def self.up
    add_column :service_ads, :photo_file_name, :string
    add_column :service_ads, :photo_content_type, :string
    add_column :service_ads, :photo_file_size, :integer
    add_column :service_ads, :photo_updated_at, :datetime
  end

  def self.down
    remove_column :service_ads, :photo_file_name
    remove_column :service_ads, :photo_content_type
    remove_column :service_ads, :photo_file_size
    remove_column :service_ads, :photo_updated_at
  end
end

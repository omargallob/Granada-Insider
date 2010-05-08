class AddRatingToServiceAd < ActiveRecord::Migration
  def self.up
    add_column :service_ads, :rating, :integer
  end

  def self.down
    remove_column :service_ads, :rating
  end
end

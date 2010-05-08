class AddValidTillToServiceAd < ActiveRecord::Migration
  def self.up
    add_column :service_ads, :valid_till, :datetime
  end

  def self.down
    remove_column :service_ads, :valid_till
  end
end

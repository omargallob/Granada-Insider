class AddSideToServiceAd < ActiveRecord::Migration
  def self.up
    add_column :service_ads, :side, :string
  end

  def self.down
    remove_column :service_ads, :side
  end
end

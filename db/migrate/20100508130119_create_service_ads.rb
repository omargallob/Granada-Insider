class CreateServiceAds < ActiveRecord::Migration
  def self.up
    create_table :service_ads do |t|
      t.string :title
      t.text :description
      t.integer :client_id
      t.string :link

      t.timestamps
    end
  end

  def self.down
    drop_table :service_ads
  end
end

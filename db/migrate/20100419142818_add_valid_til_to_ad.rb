class AddValidTilToAd < ActiveRecord::Migration
  def self.up
    add_column :ads, :valid_til, :datetime
    add_column :ads, :rating, :integer
  end

  def self.down
    remove_column :ads, :rating
    remove_column :ads, :valid_til
  end
end

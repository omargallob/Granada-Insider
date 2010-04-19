class CreateClients < ActiveRecord::Migration
  def self.up
    create_table :clients do |t|
      t.title :string
      t.text :description
      t.integer :location_id
      t.integer :review_id

      t.timestamps
    end
  end

  def self.down
    drop_table :clients
  end
end

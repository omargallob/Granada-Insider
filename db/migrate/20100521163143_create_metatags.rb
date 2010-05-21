class CreateMetatags < ActiveRecord::Migration
  def self.up
    create_table :metatags do |t|
      t.string :title
      t.text :description
      t.text :keywords
      t.integer :page_id

      t.timestamps
    end
  end

  def self.down
    drop_table :metatags
  end
end

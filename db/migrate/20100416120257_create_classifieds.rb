class CreateClassifieds < ActiveRecord::Migration
  def self.up
    create_table :classifieds do |t|
      t.string :title
      t.text :two_liner
      t.text :description
      t.integer :parent_id

      t.timestamps
    end
  end

  def self.down
    drop_table :classifieds
  end
end

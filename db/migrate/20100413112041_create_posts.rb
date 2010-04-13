class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.date :date
      t.string :author

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end

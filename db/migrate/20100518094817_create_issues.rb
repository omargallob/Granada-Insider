class CreateIssues < ActiveRecord::Migration
  def self.up
    create_table :issues do |t|
      t.string :title
      t.text :description
      t.string :publication_name
      t.text :embed_html

      t.timestamps
    end
  end

  def self.down
    drop_table :issues
  end
end
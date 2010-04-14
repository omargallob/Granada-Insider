class AddTwoLinerToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :two_liner, :string
  end

  def self.down
    remove_column :posts, :two_liner
  end
end

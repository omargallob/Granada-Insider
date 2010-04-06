class AddTwoLinerToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :two_liner, :text
  end

  def self.down
    remove_column :events, :two_liner
  end
end

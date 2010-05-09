class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :name
      t.string :company
      t.string :email
      t.string :telephone
      t.text :comment
      t.string :type
      t.string :disponibility
      t.string :job

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end

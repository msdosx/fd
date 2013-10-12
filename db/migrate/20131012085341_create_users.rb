class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :null => false, :default => ""
      t.string :name, :default => ""
      t.string :soname, :default => ""
      t.string :lastname , :default => ""
      t.date :bday
      t.text :hobby, :default => ""
      t.boolean :enabled, :default => true

      t.timestamps
    end
    add_index :users, :username,                :unique => true
  end
end

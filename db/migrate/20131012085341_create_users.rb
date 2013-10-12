class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :null => false, :default => ""
      t.string :name
      t.string :soname
      t.string :lastname
      t.date :bday
      t.text :hobby
      t.boolean :enabled, :default => true

      t.timestamps
    end
    add_index :users, :email,                :unique => true
  end
end

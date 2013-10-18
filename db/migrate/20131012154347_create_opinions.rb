class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.text :nickname
      t.text :about
      t.references :tag
      t.integer :delta_days, default: 31
      t.timestamps
    end
    add_index :opinions, :nickname, :unique => true
  end
end

class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.references :tag, index: true
      t.string :nickname
      t.text :about

      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :name
      t.string :soname
      t.string :lastname
      t.date :bday
      t.text :hobby

      t.timestamps
    end
  end
end

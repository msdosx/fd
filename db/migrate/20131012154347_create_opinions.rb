class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.text :nickname
      t.text :about
      t.references :tag

      t.timestamps
    end
  end
end

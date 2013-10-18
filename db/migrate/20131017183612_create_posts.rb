class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :message
      t.integer :likes, default: 0, null: false
      t.string :pic_url, default: '', null: false
      t.string :from
      t.references :opinion
      t.datetime :updated_time

      t.timestamps
    end
  end
end

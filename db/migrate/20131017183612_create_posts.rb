class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :message
      t.integer :likes
      t.string :pic_url
      t.string :from
      t.datetime :updated_time

      t.timestamps
    end
  end
end

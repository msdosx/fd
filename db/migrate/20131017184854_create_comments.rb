class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :message
      t.integer :likes, default: 0
      t.datetime :updated_at
      t.string :from
      t.references :post, index: true

      t.timestamps
    end
  end
end

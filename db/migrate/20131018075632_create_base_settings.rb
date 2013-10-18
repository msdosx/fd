class CreateBaseSettings < ActiveRecord::Migration
  def change
    create_table :base_settings do |t|
      t.references :tag
      t.integer :post_keep_days_delta, default: 10
      t.timestamps
    end
  end
end

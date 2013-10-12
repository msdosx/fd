class CreateFacebookNews < ActiveRecord::Migration
  def change
    create_table :facebook_news do |t|
      t.string :nickname
      t.string :about
      t.references :tag, index: true

      t.timestamps
    end
  end
end

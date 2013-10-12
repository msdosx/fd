class CreateUserLikes < ActiveRecord::Migration
  def change
    create_table :user_likes do |t|
      t.references :user, index: true
      t.references :tag, index: true
      t.integer :read_count

      t.timestamps
    end
  end
end

class CreateCreatedUsers < ActiveRecord::Migration
  def change
    create_table :created_users do |t|
      t.references :role, index: true
      t.references :user, index: true

      t.timestamps
    end

  end
end

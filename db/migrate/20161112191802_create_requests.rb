class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.text :response_text
      t.string :intent
      t.integer :user_id
      t.jsonb :slots
      t.timestamps null: false
    end
    add_foreign_key :requests, :users
  end
end

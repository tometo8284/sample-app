class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :title 
      t.string :body
      t.integer :price, null: false
      t.boolean :is_deleted, null: false, default: false
      t.timestamps
    end
  end
end

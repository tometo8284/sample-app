class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :title 
      t.string :body
      t.timestamps
    end
  end
end

class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.integer :list_id, null: false
      t.integer :user_id, null: false
      t.integer :amount, null: false
      t.timestamps
    end
  end
end

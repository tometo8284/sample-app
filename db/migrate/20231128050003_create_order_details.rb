class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :list_id, null: false
      t.integer :order_id, null: false
      t.integer :amount, null: false
      t.integer :tax_unit_price, null: false
      t.integer :create_status, null: false, default: 0 
      t.timestamps
    end
  end
end

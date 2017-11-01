class CreateOrderProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :order_products do |t|
      t.integer :order_id
      t.integer :product_id
      t.decimal :pricing
      t.integer :amount

      t.timestamps
    end
  end
end

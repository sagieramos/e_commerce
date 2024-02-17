class CreateShoppingOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :shopping_orders do |t|
      t.references :buyer, null: false, foreign_key: { to_table: :users }
      t.integer :product_quantity
      t.decimal :total_price
      t.string :payment_method

      t.timestamps
    end
  end
end

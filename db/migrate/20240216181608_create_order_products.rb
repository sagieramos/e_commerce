class CreateOrderProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :order_products do |t|
      t.references :order, null: false, foreign_key: { to_table: :shopping_orders }
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end

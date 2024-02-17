class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :photo1
      t.string :photo2
      t.string :photo3
      t.string :photo4
      t.string :photo5
      t.string :photo6
      t.decimal :price
      t.references :seller, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end

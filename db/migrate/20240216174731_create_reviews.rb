class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.string :comments
      t.integer :star_rating
      t.integer :product_id
      t.integer :user_id

      t.timestamps
    end
  end
end

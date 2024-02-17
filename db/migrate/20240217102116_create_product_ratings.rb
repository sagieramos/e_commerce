class CreateProductRatings < ActiveRecord::Migration[7.1]
  def change
    create_table :product_ratings do |t|
      t.integer :star
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end

    # Add constraint to ensure star rating is between 1 and 5
    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE product_ratings
          ADD CONSTRAINT star_rating_constraint
          CHECK (star BETWEEN 1 AND 5);
        SQL
      end
      dir.down do
        execute <<-SQL
          ALTER TABLE product_ratings
          DROP CONSTRAINT star_rating_constraint
        SQL
      end
    end
  end
end

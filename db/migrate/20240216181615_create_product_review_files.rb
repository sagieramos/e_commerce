class CreateProductReviewFiles < ActiveRecord::Migration[7.1]
  def change
    create_table :product_review_files do |t|
      t.string :file_name
      t.references :product_review, null: false, foreign_key: true

      t.timestamps
    end
  end
end

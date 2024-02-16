class CreateReviewFiles < ActiveRecord::Migration[7.1]
  def change
    create_table :review_files do |t|
      t.string :file_name
      t.references :review, null: false, foreign_key: true

      t.timestamps
    end
  end
end

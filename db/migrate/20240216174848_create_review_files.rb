class CreateReviewFiles < ActiveRecord::Migration[7.1]
  def change
    create_table :review_files do |t|
      t.string :file_name
      t.integer :review_id

      t.timestamps
    end
  end
end

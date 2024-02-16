class CreateChatFiles < ActiveRecord::Migration[7.1]
  def change
    create_table :chat_files do |t|
      t.string :file_name
      t.integer :chat_id

      t.timestamps
    end
  end
end

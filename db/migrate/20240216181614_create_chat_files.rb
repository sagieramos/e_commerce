class CreateChatFiles < ActiveRecord::Migration[7.1]
  def change
    create_table :chat_files do |t|
      t.string :file_name
      t.references :chat, null: false, foreign_key: true

      t.timestamps
    end
  end
end

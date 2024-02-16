class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string :phone1
      t.string :phone2
      t.string :ZIP
      t.integer :user_id
      t.integer :super_admin_id

      t.timestamps
    end
  end
end

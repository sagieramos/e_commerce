class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string :phone1
      t.string :phone2
      t.string :ZIP
      t.references :user, null: false, foreign_key: true
      t.references :super_admin, null: false, foreign_key: { to_table: :users}

      t.timestamps
    end
  end
end

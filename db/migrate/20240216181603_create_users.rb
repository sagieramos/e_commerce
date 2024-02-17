class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name, null: false, limit: 255
      t.string :username, null: false, limit: 255
      t.string :avatar, limit: 255
      t.string :contact_email, limit: 1024
      t.string :phone1, limit: 15
      t.string :phone2, limit: 15
      t.string :address, limit: 1024
      t.string :recent_position, limit: 255
      t.string :zip, limit: 15
      t.boolean :can_sell, default: false
      t.boolean :can_buy, default: true
      t.boolean :admin, default: false
      t.string :govt_issue_id, limit: 255
      t.boolean :verified, default: false
      t.boolean :super_admin, default: false

      t.timestamps
    end
  end
end

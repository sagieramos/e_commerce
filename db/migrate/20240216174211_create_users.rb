class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :avatar
      t.boolean :can_sell
      t.boolean :can_buy
      t.boolean :admin
      t.string :govt_issue_id
      t.boolean :verified
      t.boolean :super_admin

      t.timestamps
    end
  end
end

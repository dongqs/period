class CreateBillsUsers < ActiveRecord::Migration
  def change
    create_table :bills_users do |t|
      t.references :bill, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps null: false
    end

    add_index :bills_users, [:bill_id, :user_id]
    add_index :bills_users, [:user_id, :bill_id]
  end
end

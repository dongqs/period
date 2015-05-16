class AddPriceToBillsUsers < ActiveRecord::Migration
  def change
    add_column :bills_users, :price, :float
  end
end

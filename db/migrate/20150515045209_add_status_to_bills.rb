class AddStatusToBills < ActiveRecord::Migration
  def change
    add_column :bills, :status, :string, null: false, default: 'paid'
  end
end

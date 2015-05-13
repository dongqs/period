class AddAtToBills < ActiveRecord::Migration
  def change
    add_column :bills, :at, :datetime, null: false, default: Time.now
  end
end

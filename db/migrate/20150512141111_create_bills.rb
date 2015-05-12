class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :name
      t.references :category, index: true, foreign_key: true
      t.float :price
      t.string :comment

      t.timestamps null: false
    end
  end
end

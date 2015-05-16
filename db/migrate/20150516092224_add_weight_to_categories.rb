class AddWeightToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :weight, :integer, null: false, default: 0
  end
end

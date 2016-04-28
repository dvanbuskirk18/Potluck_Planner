class AddServingsToDishes < ActiveRecord::Migration
  def change
    add_column :dishes, :servings, :integer
  end
end

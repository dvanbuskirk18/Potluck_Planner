class RemoveServingsInDishes < ActiveRecord::Migration
  def change
    remove_column :dishes, :servings, :integer
  end
end

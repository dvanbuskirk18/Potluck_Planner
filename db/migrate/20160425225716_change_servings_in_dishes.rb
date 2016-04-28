class ChangeServingsInDishes < ActiveRecord::Migration
  def change
    change_column :dishes, :servings, :integer
  end
end

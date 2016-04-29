class ChangeServingsInDishes < ActiveRecord::Migration
  def change
    change_column :dishes, :servings, :integer, 'integer USING CAST(servinds AS integer)'
  end
end

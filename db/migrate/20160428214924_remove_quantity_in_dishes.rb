class RemoveQuantityInDishes < ActiveRecord::Migration
  def change
    remove_column :dishes, :quantity, :integer
  end
end

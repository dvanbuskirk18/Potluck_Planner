class ChangeQuantityInDishes < ActiveRecord::Migration
  def change
    change_column :dishes, :quantity, :integer
  end
end

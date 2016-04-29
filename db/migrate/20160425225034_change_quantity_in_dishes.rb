class ChangeQuantityInDishes < ActiveRecord::Migration
  def change
    change_column :dishes, :quantity, :integer, 'integer USING CAST(quantity AS integer)'
  end
end

class AddQuantityToDishes < ActiveRecord::Migration
  def change
    add_column :dishes, :quantity, :integer
  end
end

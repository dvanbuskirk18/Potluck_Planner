class AddQuantityRequestedToDishes < ActiveRecord::Migration
  def change
    add_column :dishes, :quantity_requested, :integer
  end
end

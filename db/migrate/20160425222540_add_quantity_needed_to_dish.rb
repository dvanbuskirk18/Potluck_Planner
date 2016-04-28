class AddQuantityNeededToDish < ActiveRecord::Migration
  def change
    add_column :dishes, :quantity_needed, :integer
  end
end

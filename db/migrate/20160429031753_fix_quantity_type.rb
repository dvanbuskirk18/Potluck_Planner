class FixQuantityType < ActiveRecord::Migration
  def change
    remove_column :dishes, :quantity, :string
  end
end

class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.references :event
      t.references :user
      t.string :name
      t.text :description
      t.string :user_name
      t.integer :quantity_needed
      t.integer :quantity_requested
      t.integer :quantity
      t.integer :servings

      t.timestamps null: false
    end
  end
end

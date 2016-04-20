class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.references :event
      t.references :user
      t.string :name
      t.text :description
      t.string :quantity
      t.string :servings

      t.timestamps null: false
    end
  end
end

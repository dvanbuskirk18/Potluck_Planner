class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.references :event
      t.references :user
      t.text :description

      t.timestamps null: false
    end
  end
end

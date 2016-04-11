class CreateDietaryRestrictions < ActiveRecord::Migration
  def change
    create_table :dietary_restrictions do |t|
      t.references :user
      t.references :dish
      t.string :vegan
      t.string :vegetarian
      t.string :gluten
      t.string :lactose
      t.string :egg
      t.string :fish
      t.string :shellfish
      t.string :peanuts
      t.string :tree_nuts
      t.string :soy
      t.string :kosher
      t.string :halal
      t.text :notes

      t.timestamps null: false
    end
  end
end

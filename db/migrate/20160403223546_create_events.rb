class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :user
      t.references :dish
      t.references :address
      t.string :name
      t.string :location
      t.string :date
      t.string :start_time
      t.string :end_time
      t.text :notes

      t.timestamps null: false
    end
  end
end

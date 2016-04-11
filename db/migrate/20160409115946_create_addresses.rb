class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :event
      t.string :street1
      t.string :street2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :country

      t.timestamps null: false
    end
  end
end

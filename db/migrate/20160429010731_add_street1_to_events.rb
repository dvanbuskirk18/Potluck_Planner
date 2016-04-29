class AddStreet1ToEvents < ActiveRecord::Migration
  def change
    add_column :events, :street1, :string
  end
end

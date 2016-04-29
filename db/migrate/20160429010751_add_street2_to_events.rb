class AddStreet2ToEvents < ActiveRecord::Migration
  def change
    add_column :events, :street2, :string
  end
end

class RemoveAddressIdFromEvent < ActiveRecord::Migration
  def change
    remove_column :events, :address_id, :integer
  end
end

class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.references :user
      t.references :event
      t.string :rsvp
      t.string :total_guests
      
      t.timestamps null: false
    end
  end
end

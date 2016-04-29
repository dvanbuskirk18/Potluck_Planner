# Stores Event information including guest and dish lists.
class Event < ActiveRecord::Base
  has_many :invitations
  has_many :guests, class_name: 'User', through: :invitations
  has_many :dishes
  belongs_to :host, class_name: 'User', foreign_key: :user_id
  accepts_nested_attributes_for :dishes
  validates :name, :start_time, :end_time, :street1, :city, presence: true
  validates :name, length: { minimum: 2, too_short: 'Event name is too short (minimum is 2 characters)' }

  # Returns a list of possible guests (not the host, not already attending) for guest_form.
  def possible_guests
    guests.each do |guest|
      @possible = User.all.reject { |user| user.id == guest.id || user.id == host.id }
    end
    @possible
  end

  # Helper method for event#remove_guest.
  def remove(guest)
    remove_dishes(guest)
    guests.delete(guest)
    guest.attending_events.delete(self)
  end

  # Helper method for remove method.
  def remove_dishes(guest)
    guest.dishes.each do |dish|
      dish.update(user_id: host.id) if dish.user_id == guest.id
      dish.increment_quantity
    end
  end

  # List dishes_needed in drop-down menu, if impletmented.
  def dishes_needed
    dishes_requested = host.dishes
    dishes_needed = []
    dishes_requested.each do |dish|
      dishes_needed << dish if dish.user_id == host.id
    end
  end
end

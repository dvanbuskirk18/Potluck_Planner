class Event < ActiveRecord::Base
  has_many :invitations
  has_many :guests, class_name: 'User', through: :invitations
  has_many :dishes
  has_one :address
  belongs_to :host, class_name: 'User', foreign_key: :user_id
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :dishes
  validates :name, :start_time, :end_time, presence: true
  validates :name, length: { minimum: 2, too_short: 'Event name is too short (minimum is 2 characters)' }

  def possible_guests
    guests.each do |guest|
      @possible = User.all.reject { |user| user.id == guest.id || user.id == host.id }
    end
    @possible
  end

  def remove(guest)
    remove_dishes(guest)
    guests.delete(guest)
    guest.attending_events.delete(self)
  end

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

  def bring(dish, current_user)
    dish.user_id = current_user.id
    dish.user_name = User.find(current_user.id).name
    dish.save
    current_user.dishes << dish
  end
end

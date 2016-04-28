class Dish < ActiveRecord::Base
  belongs_to :event
  belongs_to :guest, class_name: 'User', foreign_key: :user_id
  belongs_to :host, class_name: 'User', foreign_key: :user_id
  validates :name, presence: true

  # Decrements the quantity_needed of a particular dish when a guest 'brings' the dish.
  def decrement_quantity
    self.quantity_needed -= self.quantity
    self.save
  end

  # Increments the quantity_needed of a particular dish when a guest leaves an event.
  def increment_quantity
    self.quantity_needed += self.quantity
    self.save
  end
end

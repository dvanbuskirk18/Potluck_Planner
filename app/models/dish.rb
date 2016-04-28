class Dish < ActiveRecord::Base
  belongs_to :event
  belongs_to :guest, class_name: 'User', foreign_key: :user_id
  belongs_to :host, class_name: 'User', foreign_key: :user_id
  validates :name, :quantity_requested, presence: true
  # validates :quantity_requested, numericality: { only_integer: true }
  # validates :quantity, numericality: { only_integer: true }
  # validates :quantity_needed, numericality: { only_integer: true }
  # validates :servings, numericality: { only_integer: true }

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

class Event < ActiveRecord::Base
  has_many :invitations
  has_many :guests, class_name: "User", through: :invitations
  has_many :dishes
  has_one :address
  belongs_to :host, class_name: "User", foreign_key: :user_id
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :dishes
  validates :name, :start_time, :end_time, presence: true
  validates :name, length: { minimum: 2, too_short: 'Event name is too short (minimum is 2 characters)' }

  def add_guest(event_params)
  end

  def dishes_needed
    dishes_requested = self.host.dishes
    dishes_needed = []
    dishes_requested.each do |dish|
      dishes_requested << dish if dish.user_id == self.host.id
    end
    return dishes_requested
  end
end

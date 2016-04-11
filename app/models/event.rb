class Event < ActiveRecord::Base
  has_many :invitations
  has_many :guests, class_name: "User", through: :invitations
  has_many :dishes
  has_one :address
  belongs_to :host, class_name: "User", foreign_key: :user_id
  accepts_nested_attributes_for :address
  validates :name, :addres, :date, presence: true
  validates :name, length: { minimum: 2, too_short: 'Event name is too short (minimum is 2 characters)' }

  def location_valid?
  end

  def date_valid?
  end
end

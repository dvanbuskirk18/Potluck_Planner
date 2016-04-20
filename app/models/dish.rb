class Dish < ActiveRecord::Base
  belongs_to :event
  belongs_to :guest, class_name: "User", foreign_key: :user_id
  belongs_to :host, class_name: "User", foreign_key: :user_id
  # has_many :dietary_restrictions
  # accepts_nested_attributes_for :dietary_restrictions
  validates :name, presence: true

end
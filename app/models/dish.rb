class Dish < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  has_many :dietary_restrictions
  accepts_nested_attributes_for :dietary_restrictions
end

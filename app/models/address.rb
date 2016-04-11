class Address < ActiveRecord::Base
  belongs_to :event
  validates :street1, :city, presence: true
end

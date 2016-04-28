class Invitation < ActiveRecord::Base
  belongs_to :guest, class_name: 'User', foreign_key: :user_id
  belongs_to :host, class_name: 'User'
  belongs_to :hosted_event, class_name: 'Event', foreign_key: :event_id
  belongs_to :attending_event, class_name: 'Event', foreign_key: :event_id
end

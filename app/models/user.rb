require 'bcrypt'

class User < ActiveRecord::Base
  has_many :invitations
  has_many :hosted_events, class_name: "Event", foreign_key: :event_id, through: :invitations 
  has_many :attending_events, class_name: "Event",  foreign_key: :event_id, through: :invitations
  has_many :dishes
  # has_many :dietary_restrictions
  validates :name, :password_hash, :email, :phone, presence: true
  validates :name, uniqueness: true
  validates :name, length: { minimum: 2, too_short: 'Name is too short (minimum is 2 characters)' }
  validates :password_hash, length: { minimum: 5, too_short: 'Password is too short (minimum is 5 characters)'}
  validate :name_valid?
  # validate :email_valid?
  # validates :email, format: { with: /\S+@\w+.\w+/, message: 'please enter a valid email' }
  validate :phone_valid?
  validates_with EmailAddress::ActiveRecordValidator, field: :email
  # accepts_nested_attributes_for :dietary_restrictions

  def name_valid?
    if name.scan(/\A[A-Z]/).empty?
      errors.add(:name, 'Name is not capitalized') 
    end
  end

  def email_valid?
    if email.scan(/\@/).length != 1
      errors.add(:email, 'Email needs one @ symbol')
    end
    if email.scan(/\w\@\w/).empty?
      errors.add(:email, 'Email needs at least one character before and after the @ symbol')
    end
    if email.scan(/\w\.\w/).empty?
      errors.add(:email, 'Email needs at least one character before and after the period')
    end
    if email.scan(/\@\w+\./).empty?
      errors.add(:email, 'Email needs to have an @ symbol followed by at least one character and a period')
    end
  end

  def phone_valid?
    if phone.scan(/\d/).size != 10
      errors.add(:phone, 'Phone number needs to have 10 digits')
    end
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def attending
    attending_all = self.attending_events
    attending = []
    attending_all.each do |event|
      if event.host == self
        next
      else
        attending << event
      end
    end
    return attending
  end
end

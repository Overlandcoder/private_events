class Event < ApplicationRecord
  has_many :invitations, foreign_key: :created_event_id
  has_many :attendees, through: :invitations, source: :attendee
  belongs_to :creator, class_name: "User"

  def self.in_the_past
    self.where("Date < ?", Date.current)
  end

  def self.in_the_future
    self.where("Date > ?", Date.current)
  end
end

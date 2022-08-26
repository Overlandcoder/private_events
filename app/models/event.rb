class Event < ApplicationRecord
  has_many :invitations, foreign_key: :created_event_id
  has_many :attendees, through: :invitations, source: :attendee
  belongs_to :creator, class_name: "User"

  scope :in_the_past, -> { where("date < ?", Date.current) }
  scope :in_the_future, -> { where("date > ?", Date.current) }
end

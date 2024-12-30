class BathroomEvent < ApplicationRecord
  belongs_to :bathroom_session
  enum :event_type, { pee: "pee", poop: "poop" }

  validates :event_type, inclusion: { in: [ "pee", "poop" ] }
end

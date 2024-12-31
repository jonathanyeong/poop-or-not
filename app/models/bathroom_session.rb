class BathroomSession < ApplicationRecord
  has_many :bathroom_events
  belongs_to :user
end

class Cruise < ActiveRecord::Base
  belongs_to :cruiseline
  belongs_to :ship
  has_many :cruise_events
end

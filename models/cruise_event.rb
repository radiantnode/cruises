class CruiseEvent < ActiveRecord::Base
  belongs_to :cruise
  belongs_to :port
  enum event_type: [ :port, :cruising ]
end

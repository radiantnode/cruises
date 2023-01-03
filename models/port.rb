class Port < ActiveRecord::Base
  def cruises
    @cruises ||= Cruise.includes(:cruise_events).where('cruise_events.port_id': id)
  end
end

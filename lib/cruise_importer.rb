# Imports cruises into the database from a canonical JSON file

class CruiseImporter
  DEFAULT_JSON_PATH = "./db/cruises.json"

  def initialize(json_path = DEFAULT_JSON_PATH)
    @json_file = File.read(json_path)
    @json_data = JSON.parse(@json_file)
  end
  
  def import
    @json_data.each do |cruise_data|
      cruiseline = Cruiseline.find_or_create_by(name: cruise_data['cruiseline'])
      ship = cruiseline.ships.find_or_create_by(name: cruise_data['ship'])

      cruise = cruiseline.cruises.find_or_create_by(name: cruise_data['name'], cabin: cruise_data['cabin'], start_date: cruise_data['start_date'], end_date: cruise_data['end_date'], ship: ship)

      cruise_data['itinerary'].each do |event|
        port = Port.find_or_create_by(name: event['name']) if event['type'] == "port"

        cruise.cruise_events.find_or_create_by(event_type: event['type'], date: event['date'], port: port)
      end
    end
  end
end

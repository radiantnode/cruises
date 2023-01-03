class CreateCruiseEvents < ActiveRecord::Migration[7.0]
  def up
    create_table :cruise_events do |t|
      t.date :date
      t.integer :event_type, default: 0
      t.references :cruise, foreign_key: true
      t.references :port, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :cruise_events
  end
end

class CreateCruises < ActiveRecord::Migration[7.0]
  def up
    create_table :cruises do |t|
      t.string :name
      t.string :cabin
      t.references :cruiseline, foreign_key: true
      t.references :ship, foreign_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end

  def down
    drop_table :cruises
  end
end

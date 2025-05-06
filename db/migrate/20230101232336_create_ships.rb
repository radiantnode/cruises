class CreateShips < ActiveRecord::Migration[7.0]
  def up
    create_table :ships do |t|
      t.string :name
      t.references :cruiseline, foreign_key: true

      t.timestamps
    end
  end

  def down
    drop_table :ships
  end
end

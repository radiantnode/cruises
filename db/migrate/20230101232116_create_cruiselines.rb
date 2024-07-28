class CreateCruiselines < ActiveRecord::Migration[7.0]
  def up
    create_table :cruiselines do |t|
      t.string :name

      t.timestamps
    end
  end

  def down
    drop_table :cruiselines
  end
end

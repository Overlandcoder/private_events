class DropEventsAttendedTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :events_attendeds
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end

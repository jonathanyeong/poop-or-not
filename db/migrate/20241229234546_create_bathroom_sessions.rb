class CreateBathroomSessions < ActiveRecord::Migration[8.0]
  def change
    create_table :bathroom_sessions do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :location

      t.timestamps
    end
  end
end

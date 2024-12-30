class CreateBathroomEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :bathroom_events do |t|
      t.string :event_type
      t.references :bathroom_session, null: false, foreign_key: true

      t.timestamps
    end
  end
end

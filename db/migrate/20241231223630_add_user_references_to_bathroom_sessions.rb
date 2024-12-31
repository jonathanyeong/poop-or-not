class AddUserReferencesToBathroomSessions < ActiveRecord::Migration[8.0]
  def change
    add_reference(:bathroom_sessions, :user)
  end
end

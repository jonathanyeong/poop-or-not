require "csv"

class BathroomSessionsController < ApplicationController
  def index
  end

  def update
    @bathroom_session = BathroomSession.find(params[:id])
    @bathroom_session.update!(end_time: Time.current)
    redirect_to root_path
  end


  def new
    @bathroom_session = BathroomSession.create!(
      start_time: Time.current,
      user_id: Current.session.user_id
    )
  end

  def export
    user = User.find(Current.session.user_id)
    sessions = user.bathroom_sessions.includes(:bathroom_events).order(created_at: :desc).reload

    respond_to do |format|
      format.csv do
        csv_data = CSV.generate do |csv|
          # Headers
          csv << [
            "Start Time",
            "End Time",
            "Duration (seconds)",
            "Total Events",
            "Pee Events",
            "Poop Events",
            "Time to First Poop (seconds)"
          ]

          # Data rows
          sessions.each do |session|
            first_poop = session.bathroom_events.find { |event| event.event_type == "poop" }
            time_to_first_poop = first_poop ? (first_poop.created_at - session.start_time).to_i : nil

            csv << [
              session.start_time,
              session.end_time,
              session.end_time ? (session.end_time - session.start_time).to_i: nil,
              session.bathroom_events.count,
              session.bathroom_events.where(event_type: "pee").count,
              session.bathroom_events.where(event_type: "poop").count,
              time_to_first_poop
            ]
          end
        end

        send_data csv_data,
          filename: "bathroom-sessions-#{Time.current.to_i}.csv",
          type: "text/csv"
      end
    end
  end
end

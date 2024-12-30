class BathroomEventsController < ApplicationController
  def create
    @bathroom_session = BathroomSession.find(params[:bathroom_session_id])
    @bathroom_event = @bathroom_session.bathroom_events.create!(
      event_type: params[:event_type]
    )

    respond_to do |format|
      format.turbo_stream {
        render turbo_stream: [
          turbo_stream.update("bathroom_events",
            partial: "bathroom_sessions/bathroom_events",
            locals: { bathroom_session: @bathroom_session }
          ),
          turbo_stream.append("toast-container",
            partial: "shared/toast",
            locals: { message: "Saved #{params[:event_type]} event! 🎉" }
          )
        ]
      }
    end
  end
end

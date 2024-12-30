class BathroomEventsController < ApplicationController
  def create
    @bathroom_session = BathroomSession.find(params[:bathroom_session_id])
    @bathroom_event = @bathroom_session.bathroom_events.create!(
      event_type: params[:event_type]
    )

    redirect_to new_bathroom_session_path
  end
end

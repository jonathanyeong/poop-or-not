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
      start_time: Time.current
    )
  end

  def create
  end
end

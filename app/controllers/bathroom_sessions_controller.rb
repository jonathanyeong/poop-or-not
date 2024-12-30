class BathroomSessionsController < ApplicationController
  def index
  end

  def new
    @bathroom_session = BathroomSession.create!(
      start_time: Time.current
    )
  end

  def create
  end
end

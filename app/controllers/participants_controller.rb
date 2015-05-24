class ParticipantsController < ApplicationController
  before_filter :authenticate_user!

  expose(:event)

  def create
    event.users << current_user
    event.save
    redirect_to event_url(event.id)
  end

  def destroy

  end
end

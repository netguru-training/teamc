class ParticipantsController < ApplicationController
  before_filter :authenticate_user!

  expose(:event)

  def create
    event.users << current_user
    event.save
    flash[:success] = "Joined #{event.name} event"
    redirect_to event_url(event.id)
  end

  def destroy
    event.users.delete(params[:id])
    event.save
    flash[:info] = "Unjoined #{event.name} event"
    redirect_to event_url(event.id)
  end
end

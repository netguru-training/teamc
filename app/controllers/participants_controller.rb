class ParticipantsController < ApplicationController
  before_filter :authenticate_user!

  expose(:event)

  def create
    unless event.users.include? current_user
      event.users << current_user
      event.save
      flash[:success] = "Joined #{event.name} event"
      event_notifier(current_user)
    else
      flash[:danger] = "You are already signed in"
    end
    redirect_to event_url(event.id)
  end

  def destroy
    event.users.delete(params[:id])
    event.save
    flash[:info] = "Unjoined #{event.name} event"
    redirect_to event_url(event.id)
  end

  private

    def event_notifier(user)
      UserMailer.delay(run_at: event.datetime - 2.hours).event_notification(user, event)
    end
end

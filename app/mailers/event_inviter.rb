class EventInviter < ApplicationMailer
  default from: 'invite@boardgamesevents.com'

  def event_invite(owner, event, user)
    @owner = owner
    @event = event
    @user = user
    mail (to: @user.email, subject: "#{@owner.name} has invited You to event #{@event.name}!")
  end
end

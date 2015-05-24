class EventInviter < ApplicationMailer
  default from: 'invite@boardgamesevents.com'

  def event_invite(owner, event, email)
    @owner = owner
    @event = event
    @email = email
    mail (to: email, subject: "#{@owner.name} has invited You to event #{@event.name}!")
  end
end

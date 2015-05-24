class UserMailer < ApplicationMailer
  default from: 'notification@boardgamesevents.com'

  def event_notification(user, event)
    @user = user
    @event = event
    mail (to: @user.email, subject: "#{@event.name} is coming!")
  end
end

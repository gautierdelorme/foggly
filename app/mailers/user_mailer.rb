class UserMailer < ApplicationMailer
  def inbox_email(user, sender, message)
    @user = user
    @sender = sender
    @message = message
    mail to: @user.email, subject: "You received a message from #{@sender.name}"
  end
end

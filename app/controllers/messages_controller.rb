class MessagesController < ApplicationController
  def create
    @conversation = current_user.conversations.find(params[:conversation_id])
    @message = @conversation.messages.new(message_params)

    if @message.save
      UserMailer.inbox_email(@conversation.participant_not(current_user), current_user, @message.body).deliver_later
      redirect_to @conversation
    else
      redirect_to @conversation, flash: { error: 'Message was not sent.' }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def message_params
    params.require(:message).permit(:conversation_id, :body, :read).merge(user_id: current_user.id)
  end
end

class ConversationsController < ApplicationController
  def index
    @conversations = current_user.conversations.order updated_at: :desc
    @conversation = @conversations.new
  end

  def show
    @conversation = Conversation.find(params[:id]).tap do |conversation|
      conversation.messages.unread_by(current_user).update(read: true)
    end
    @message = Message.new
  end

  def create
    @conversation = Conversation.new(conversation_params)
    if @conversation.save
      redirect_to @conversation, notice: 'Conversation was successfully created.'
    elsif @conversation.already_exist?
      redirect_to @conversation.similar
    else
      redirect_to conversations_path, flash: { error: @conversation.errors.full_messages.to_sentence }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def conversation_params
    params.require(:conversation).permit(:participant_id).merge(user_id: current_user.id)
  end
end

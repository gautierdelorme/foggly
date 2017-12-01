class ConversationsController < ApplicationController
  before_action :set_conversation, only: :show

  def index
    @conversations = policy_scope(Conversation).order updated_at: :desc
  end

  def show
    authorize @conversation
    @conversation.messages.unread_by(current_user).update(read: true)
    @message = Message.new
  end

  def create
    @conversation = Conversation.new(conversation_params)
    if @conversation.save
      redirect_to @conversation, notice: 'Conversation was successfully created.'
    elsif @conversation.already_exist?
      redirect_to @conversation.similar
    else
      redirect_back fallback_location: conversations_url, flash: { error: @conversation.errors.full_messages.to_sentence }
    end
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def conversation_params
    params.require(:conversation).permit(:participant_id).merge(user_id: current_user.id)
  end
end

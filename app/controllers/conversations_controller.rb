class ConversationsController < ApplicationController
  before_filter :authenticate_user!

  layout false

  def index
    @conversations = Conversation.all
  end

  def show
  end

  def new
    @conversation = Conversation.new
  end

  def edit
  end


  def create
    if Conversation.between(params[:sender_id],params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id],params[:recipient_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end

    render json: { conversation_id: @conversation.id }
  end

  def show
    @conversation = Conversation.find(params[:id])
    @reciever = conversation_message(@conversation)
    @messages = @conversation.messages
    @message = Message.new
  end

  private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end

  def conversation_message(conversation)
    current_user == conversation.recipient ? conversation.sender : conversation.recipient
  end
end


module UsersHelper
  def conversation_message(conversation)
    conversation.recipient == current_user ? conversation.sender : conversation.recipient
  end
end
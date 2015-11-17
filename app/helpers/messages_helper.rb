module MessagesHelper
  def self_or_other(message)
    message.user == current_user ? "self" : "other"
  end

  def sender_message(message)
    message.user == message.conversation.sender ? message.conversation.sender : message.conversation.recipient
  end
end

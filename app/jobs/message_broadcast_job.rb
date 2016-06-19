class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    p "PERFORM"
    room = Room.find(message.room_id)
    session = Session.where(facebook_id: room.facebook_id).last
    if message.sender == "user"
      ActionCable.server.broadcast "room_channel_#{message.room_id}", message: ApplicationController.renderer.render(partial: 'messages/bot_message', locals: { message: message })
      ActionCable.server.broadcast "room_channel_0", room: "#{message.room_id}", status: "#{session.status}"
    elsif message.sender == "bot"
      p "FOR BOT"
      p message.room_id
      p ActionCable.server.broadcast "room_channel_#{message.room_id}", message: render_bot_message(message)
      p ActionCable.server.broadcast "room_channel_0", room: "#{message.room_id}", status: "#{session.status}"
    end
  end

  private

  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/text_message', locals: { message: message })
  end
   def render_bot_message(message)
    # p message
    # p "CLASS"
    # p message.content.class
    # p eval(message.content).class
      if message.structured_messages.nil? == false && message.structured_messages["attachment"].present?
        if (eval(message.structured_messages).with_indifferent_access)[:attachment][:payload][:template_type] == "generic"
          ApplicationController.renderer.render(partial: "messages/structured_message_carousel", locals: { message: (eval(message.structured_messages).with_indifferent_access)})
        elsif (eval(message.structured_messages).with_indifferent_access)[:attachment][:payload][:template_type] == "button"
          ApplicationController.renderer.render(partial: "messages/structured_message_button", locals: { message: (eval(message.structured_messages).with_indifferent_access)})
        elsif (eval(message.structured_messages).with_indifferent_access)[:attachment][:payload][:template_type] == "receipt"
          ApplicationController.renderer.render(partial: "messages/structured_message_receipt",locals: { message: (eval(message.structured_messages).with_indifferent_access)})
        else
          ApplicationController.renderer.render(partial: "messages/image",locals: { message: message })
      end
    else
      ApplicationController.renderer.render(partial: "messages/text_message", locals: { message: message })
    end
  end
end

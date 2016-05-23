class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    if message.sender == "user"
      ActionCable.server.broadcast "room_channel_#{message.room_id}", message: render_message(message), context: message.context
      ActionCable.server.broadcast "room_channel_0", room: "#{message.room_id}"
    elsif message.sender == "bot"
      ActionCable.server.broadcast "room_channel_#{message.room_id}", message: render_bot_message(message), context: message.context
      ActionCable.server.broadcast "room_channel_0", room: "#{message.room_id}"
    end
  end

  private

  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/text_message', locals: { message: message })
  end

  def render_bot_message(message)
    p message
    p "CLASS"
    p message.content.class
    p eval(message.content).class
    if eval(message.content)[:attachment].present?
      if eval(message.content)[:attachment][:payload][:template_type] == "generic"
       ApplicationController.renderer.render(partial: 'messages/structured_message_carousel', locals: { message: eval(message.content)})
       elsif eval(message.content)[:attachment][:payload][:template_type] == "button"
         ApplicationController.renderer.render(partial: 'messages/structured_message_button', locals: { message: eval(message.content)})
      elsif eval(message.content)[:attachment][:payload][:template_type] == "receipt"
        ApplicationController.renderer.render(partial: 'messages/structured_message_receipt', locals: { message: eval(message.content)})
      else
       ApplicationController.renderer.render(partial: 'messages/bot_message', locals: { message: message })
      end
    else
        ApplicationController.renderer.render(partial: 'messages/bot_message', locals: { message: message })
    end
  end
end

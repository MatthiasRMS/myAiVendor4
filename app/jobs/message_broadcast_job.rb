class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    if message.sender == "user"
      ActionCable.server.broadcast "room_channel_#{message.room_id}", message: render_message(message)
      ActionCable.server.broadcast "room_channel_0", room: "0"
    elsif message.sender == "bot"
      ActionCable.server.broadcast "room_channel_#{message.room_id}", message: render_bot_message(message)
      ActionCable.server.broadcast "room_channel_0", room: "0"
    end
  end

  private

  def render_message(message)
    ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end

  def render_bot_message(message)
    ApplicationController.renderer.render(partial: 'messages/bot_message', locals: { message: message })
  end
end

# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel
  def subscribed
    room = params[:room].to_i
    stream_from "room_channel_#{room}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # ActionCable.server.broadcast "room_channel_0", message: "room 0"
    # ActionCable.server.broadcast "room_channel_#{data['id']}", message: data["id"]
    if data["id"].to_i > 0
      @message = Message.new
      @message.sender = "bot"
      @message.content = data['message']
      @message.room_id = data["id"].to_i
      @message.save!
      MessageBroadcastJob.perform_later @message
    end
  end
end

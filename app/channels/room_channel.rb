# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    p "ID"
    p data["id"]
    @message = Message.new
    @message.content = data['message']
    @message.room_id = data["id"].to_i
    @message.save!
    #Message.update(room_id: data['id'])
  end
end

# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class RoomChannel < ApplicationCable::Channel
  def subscribed
    room = params[:room].to_i
    stream_from "room_channel_0"
    stream_from "room_channel_#{room}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    if data["id"].to_i > 0
      @message = Message.new
      @message.content = data['message']
      @message.room_id = data["id"].to_i
      @message.save!
    end
    #Message.update(room_id: data['id'])
  end
end

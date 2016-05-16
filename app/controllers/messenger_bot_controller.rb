class MessengerBotController < ActionController::Base

  def webhook
    render :json => params["hub.challenge"]
  end

  def search(msg, session)

  end

  def message(event, sender)
    msg = event["message"]["text"]
    sender_id = event["sender"]["id"]
    room = find_or_create_room(sender_id, sender)
    session = find_or_create_session(sender_id)
    session.update(last_exchange: Time.now)

    @message = Message.new({content: msg, room_id: room.id, sender: "user"})
    @message.save!

    sender.reply({text: "Hey"})
    @message_sent = Message.new({content: "Hey", room_id: room.id, sender: "bot" })
    @message_sent.save!
  end

  def postback(event, sender)
    payload = event["postback"]["payload"]
  end

  private

  def find_or_create_session(fbid, max_age: 2.minutes)
    Session.find_by(["facebook_id = ? AND last_exchange >= ?", fbid, max_age.ago]) ||
    Session.create(facebook_id: fbid, context: {})
  end

  def find_or_create_room(fbid, sender)
    Room.find_by(["facebook_id = ?", fbid]) ||
    Room.create(facebook_id: fbid, first_name: sender.get_profile[:body]["first_name"])
  end
end

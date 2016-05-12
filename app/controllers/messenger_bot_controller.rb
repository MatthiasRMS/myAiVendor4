class MessengerBotController < ActionController::Base

  def webhook
    render :json => params["hub.challenge"]
  end

  def search(msg, session)
    # bot_modules = ["hello", "joke", "quote"]
    # session.context["intent"] = intent_determination(msg)
    # session.save
    # if bot_modules.include? session.context["intent"]
    #   send session.context["intent"]
    # else
    #   "I'm not sure to understand ... Could you please rephrase ?"
    # end
  end

  def message(event, sender)
    msg = event["message"]["text"]
    sender_id = event["sender"]["id"]
    room = find_or_create_room(sender_id)
    @message = Message.new({content: msg, room_id: room.id, sender: "user" })
    @message.save!


    sender.reply({text: "Hey"})
    @message_sent = Message.new({content: "Hey", room_id: room.id, sender: "bot" })
    @message_sent.save!

    # if msg.nil?
    #   "I'm not sure to understand ... Could you please rephrase ?"
    # else

    # session = find_or_create_session(sender_id)


    #   session.update(last_exchange: Time.now)
    #   url = "https://scontent-fra3-1.xx.fbcdn.net/t31.0-8/13112827_1001542186602948_437179276631081534_o.jpg"
    #   @template = GenericTemplate.new()
    #   @template.add_element("hey", "", url, "subtitle")
    #   p @template
    #   p @template.get_message
    #   sender.reply(@template.get_message)
    #   sender.reply(TextTemplate.new(search(msg, session)).get_message)
    # end
  end

  def postback(event, sender)
    payload = event["postback"]["payload"]
  end

  private

  # def intent_determination(msg)
  #   keywords = [["hello", "hi"], ["help"], ["exit"], ["wiki", "wikipedia"], ["define", "definition"], ["joke"], ["quote"]]
  #   tokenized_array = msg.downcase.split
  #   keywords.each {|a| return a.first if (tokenized_array & a).any? }
  # end

  # def find_or_create_session(fbid, max_age: 2.minutes)
  #   Session.find_by(["facebook_id = ? AND last_exchange >= ?", fbid, max_age.ago]) ||
  #   Session.create(facebook_id: fbid, context: {})
  # end

  def find_or_create_room(fbid)
    Room.find_by(["facebook_id = ?", fbid]) ||
    Room.create(facebook_id: fbid)
  end
end

class Api::V1::SessionsController < Api::V1::BaseController

 #acts_as_token_authentication_handler_for User, except: [ :index, :show ]
 before_action :set_session, only: [ :show, :update ]

 def update
   if @session.update(session_params)
     render :show
   else
     render_error
   end
 end

  def create
    params.permit!
    profile_picture = CGI.unescape(params[:profile_pic])
    @room = find_or_create_room(params[:fbid], params[:first_name], profile_picture, params["bot_id"])
    if verify_signature(@room.bot.secret, @room.bot.api_key, params["key"])
      puts "Valid signature"
      @session = find_or_create_session(params[:fbid])
      p @session
      p params
      p params["msg"].class
      p params["profile_pic"]

      @room.update(profile_picture: profile_picture)
      if params["msg"].include? "attachment"
        @message = Message.new({structured_messages: params["msg"], room_id: @room.id, sender: params[:sender], context: params[:context]})
      else
        @message = Message.new({content: params["msg"], room_id: @room.id, sender: params[:sender], context: params[:context]})
      end
      @message.save!
      @session.update(status: update_session_status(@session, @room) )
    else
      puts "Invalid signature"
    end
 end

 private

 def session_params
   params.require(:session).permit(:name, :address)
 end

 def render_error
   render json: { errors: @session.errors.full_messages }, status: :unprocessable_entity
 end

 def find_or_create_session(fbid, max_age: 2.minutes)
    Session.find_by(["facebook_id = ? AND last_exchange >= ?", fbid, max_age.ago]) ||
    Session.create(facebook_id: fbid, context: {})
  end

  def find_or_create_room(fbid, first_name, profile_picture, api_key)
    bot = Bot.find_by api_key: api_key
    Room.find_by(["facebook_id = ?", fbid]) ||
    Room.create(facebook_id: fbid, first_name: first_name, profile_picture: profile_picture, bot_id: bot.id )
  end

  def verify_signature(secret, api_key, encoded_key)
    p "VERIFICATION"
    p encoded_key
    p secret
    p api_key
    p Digest::SHA1.hexdigest("--#{secret}--#{api_key}--")
    return true if params["key"] == Digest::SHA1.hexdigest("--#{secret}--#{api_key}--")
  end

  def update_session_status(session, room)
    # 'Backer_assigned' (orange sticker)
    if session.context["intent"] == "lost"
      status = 'blocked'
    # 'Active' session (green sticker)
    elsif Time.now - room.messages.last.created_at < 3000
      status = 'active'
    #'Inactive' session (grey sticker)
    else
      status = 'inactive'
    end
    status
  end

end


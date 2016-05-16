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
   @session = find_or_create_session(params[:fbid])
   p @session
   @room = find_or_create_room(params[:fbid], params[:first_name])
   @message = Message.new({content: params["msg"], room_id: @room.id, sender: "user"})
   @message.save!

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

  def find_or_create_room(fbid, first_name)
    Room.find_by(["facebook_id = ?", fbid]) ||
    Room.create(facebook_id: fbid, first_name: first_name)
  end

end

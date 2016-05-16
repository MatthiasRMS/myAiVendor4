class SessionsController < ApplicationController

 acts_as_token_authentication_handler_for User, except: [ :index, :show ]
 before_action :set_session, only: [ :show, :update ]

 def update
   if @session.update(session_params)
     render :show
   else
     render_error
   end
 end

 def create
   @session = current_user.sessions.build(session_params)
   authorize @session
   if @session.save
     render :show
   else
     render_error
   end
 end

 private

 def session_params
   params.require(:session).permit(:name, :address)
 end

 def render_error
   render json: { errors: @session.errors.full_messages }, status: :unprocessable_entity
 end

end

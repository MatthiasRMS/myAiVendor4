class SessionsController < ApplicationController


# So that the user can update the context of a session
 def update
   session = Session.find(params[:id])
   @context = {intent: params["context"]["browsing"]}
   session.update(context: @context)
   respond_to do |format|
     format.js
   end
 end

end

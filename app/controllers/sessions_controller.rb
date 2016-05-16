class SessionsController < ApplicationController
 def update
   session = Session.find(params[:id])
   @context = {intent: params["context"]["browsing"]}
   session.update(context: @context)
   respond_to do |format|
     format.js
   end
 end
end

class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @no_footer = true
  end

  def update_index
    @room = Room.find(params[:room_id])
    @messages = @room.messages
    respond_to do |format|
      format.js
    end
  end

   def show
      @room = Room.find(params[:id])
      @messages = Message.where(room_id: @room.id)
      @no_footer = true
      @session = Session.where(facebook_id:@room.facebook_id).last
  end
end

class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @messages = Message.where(room_id: @room.id)
    @no_footer = true
    @session = Session.where(facebook_id:@room.facebook_id).last

  end
end

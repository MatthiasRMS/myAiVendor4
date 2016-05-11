class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @messages = Message.where(room_id: @room.id)
    @no_footer = true
  end
end

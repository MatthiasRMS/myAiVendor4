class BotsController < ApplicationController

  def new
    @bot = Bot.new
  end

  def create
    @bot = Bot.new(bot_params)
    if @bot.save
      redirect_to bot_path(@bot)
    else
      render :new
    end
  end

  def show
    @bot = Bot.find(params[:id])
  end

  def bot_params
     params.require(:bot).permit(:brand, :endpoint) #, prizes_attributes: [:id, :title, :quantity, :description, :prize_picture])
  end
end

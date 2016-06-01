class BotsController < ApplicationController

  def new
    @bot = Bot.new
  end

  def create
    @bot = Bot.new(bot_params)
    @bot.secret = SecureRandom.hex
    @bot.api_key = SecureRandom.hex
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
     params.require(:bot).permit(:brand, :reception_endpoint, :emission_endpoint, parameters_attributes: [:input_type, :name])
  end
end

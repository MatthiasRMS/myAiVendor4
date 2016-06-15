class BotsController < ApplicationController

  def new
    @bot = Bot.new
  end

  def edit
    @bot = Bot.find(params[:id])
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

  def update
    @bot = Bot.find(params[:id])
    @bot.update(bot_params)
    redirect_to bot_path(@bot)
  end

  def show
    @bot = Bot.find(params[:id])
  end

  def bot_params
     params.require(:bot).permit(:service, :access_token, :brand, :reception_endpoint, :emission_endpoint, entities_attributes: [:input_type, :name])
  end
end

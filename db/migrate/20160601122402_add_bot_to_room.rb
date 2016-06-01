class AddBotToRoom < ActiveRecord::Migration[5.0]
  def change
    add_reference :rooms, :bot, foreign_key: true
  end
end

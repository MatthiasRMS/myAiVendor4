class AddBotDescriptionToBots < ActiveRecord::Migration[5.0]
  def change
    add_column :bots, :bot_description, :text
  end
end

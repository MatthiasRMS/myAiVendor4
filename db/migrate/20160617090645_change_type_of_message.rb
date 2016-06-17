class ChangeTypeOfMessage < ActiveRecord::Migration[5.0]
  def change
    change_column :messages, :structured_messages, :text
  end
end

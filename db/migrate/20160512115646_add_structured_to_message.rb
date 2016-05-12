class AddStructuredToMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :structured_messages, :jsonb
  end
end

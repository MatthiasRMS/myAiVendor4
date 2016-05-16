class CreateSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :sessions do |t|
      t.integer :facebook_id, limit: 8
      t.jsonb :context
      t.string :status
      t.datetime :last_exchange
      t.integer :count_messages

      t.timestamps
    end
  end
end

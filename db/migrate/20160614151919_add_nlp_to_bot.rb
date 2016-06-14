class AddNlpToBot < ActiveRecord::Migration[5.0]
  def change
    add_column :bots, :service, :string
    add_column :bots, :access_token, :string
  end
end

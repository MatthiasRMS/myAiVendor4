class AddReceptionEndpointToBot < ActiveRecord::Migration[5.0]
  def change
    add_column :bots, :reception_endpoint, :string
    rename_column :bots, :endpoint, :emission_endpoint
  end
end

class AddSecretToBot < ActiveRecord::Migration[5.0]
  def change
    add_column :bots, :secret, :string
  end
end

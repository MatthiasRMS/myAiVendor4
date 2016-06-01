class AddNameToParameter < ActiveRecord::Migration[5.0]
  def change
    add_column :parameters, :name, :string
  end
end

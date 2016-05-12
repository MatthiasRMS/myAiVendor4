class AddFirstToRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :first_name, :string
  end
end

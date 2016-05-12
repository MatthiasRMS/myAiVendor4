class AddFacebookToRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :facebook_id, :integer, limit: 8
  end
end

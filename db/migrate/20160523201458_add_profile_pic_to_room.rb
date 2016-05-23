class AddProfilePicToRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :profile_picture, :string
  end
end

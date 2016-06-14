class CreateEndUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :end_users do |t|
      t.string :first_name
      t.string :last_name
      t.string :profile_picture
      t.string :gender
      t.integer :facebook_id
      t.string :local_time_zone

      t.timestamps
    end
  end
end

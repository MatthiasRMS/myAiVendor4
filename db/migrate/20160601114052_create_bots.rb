class CreateBots < ActiveRecord::Migration[5.0]
  def change
    create_table :bots do |t|
      t.string :brand
      t.string :endpoint

      t.timestamps
    end
  end
end

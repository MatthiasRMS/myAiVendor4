class RenameType < ActiveRecord::Migration[5.0]
  def change
    rename_column :parameters, :type, :input_type
  end
end

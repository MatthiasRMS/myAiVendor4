class RenamingParameterTableToEntities < ActiveRecord::Migration[5.0]
  def change
    rename_table :parameters, :entities
  end
end

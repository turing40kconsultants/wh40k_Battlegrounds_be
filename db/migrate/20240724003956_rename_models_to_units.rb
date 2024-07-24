class RenameModelsToUnits < ActiveRecord::Migration[7.1]
  def change
    rename_table :models, :units
  end
end

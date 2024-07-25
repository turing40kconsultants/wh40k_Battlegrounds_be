class RenameTableFactionstoFactions < ActiveRecord::Migration[7.1]
  def change
    rename_table :table_factions, :factions
  end
end

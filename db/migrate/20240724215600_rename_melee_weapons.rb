class RenameMeleeWeapons < ActiveRecord::Migration[7.1]
  def change
    rename_table :melee_weapons, :weapons
  end
end

class RenameMeleeWeaponUnitstoWeaponUnits < ActiveRecord::Migration[7.1]
  def change
    rename_table :melee_weapons_units, :weapon_units
  end
end

class RenameTableWeaponUnitstoWeaponUnit < ActiveRecord::Migration[7.1]
  def change
    rename_table :weapon_units, :weapon_unit
  end
end

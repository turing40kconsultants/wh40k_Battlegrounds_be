class RenameColumnMeleeWeaponIdtoWeaponId < ActiveRecord::Migration[7.1]
  def change
    rename_column :weapon_units, :melee_weapon_id, :weapon_id

  end
end

class RenameWeaponWeaponAbilitiesColumnMeleeWeaponIdtoWeaponId < ActiveRecord::Migration[7.1]
  def change
    rename_column :weapons_weapon_abilities, :melee_weapon_id, :weapon_id
  end
end

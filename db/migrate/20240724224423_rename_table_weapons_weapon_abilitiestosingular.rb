class RenameTableWeaponsWeaponAbilitiestosingular < ActiveRecord::Migration[7.1]
  def change
    rename_table :weapons_weapon_abilities, :weapon_weapon_ability
  end
end

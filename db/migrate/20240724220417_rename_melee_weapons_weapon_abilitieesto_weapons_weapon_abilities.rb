class RenameMeleeWeaponsWeaponAbilitieestoWeaponsWeaponAbilities < ActiveRecord::Migration[7.1]
  def change
    rename_table :melee_weapons_weapon_abilities, :weapons_weapon_abilities
  end
end

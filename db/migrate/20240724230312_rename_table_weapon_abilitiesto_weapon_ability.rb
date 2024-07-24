class RenameTableWeaponAbilitiestoWeaponAbility < ActiveRecord::Migration[7.1]
  def change
    rename_table :weapon_abilities, :weapon_ability
  end
end

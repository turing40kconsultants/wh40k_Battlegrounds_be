class FixTableNames < ActiveRecord::Migration[7.1]
  def change
    rename_table :weapon, :weapons
    rename_table :weapon_ability, :weapon_abilities
    rename_table :weapon_unit, :weapon_units
    rename_table :weapon_weapon_ability, :weapon_weapon_abilities
  end
end

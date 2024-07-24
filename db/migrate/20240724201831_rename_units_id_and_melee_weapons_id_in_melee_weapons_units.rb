class RenameUnitsIdAndMeleeWeaponsIdInMeleeWeaponsUnits < ActiveRecord::Migration[7.1]
  def change
    rename_column :melee_weapons_units, :units_id, :unit_id

    rename_column :melee_weapons_units, :melee_weapons_id, :melee_weapon_id
  end
end

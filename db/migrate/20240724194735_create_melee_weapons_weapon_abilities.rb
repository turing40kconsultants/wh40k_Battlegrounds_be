class CreateMeleeWeaponsWeaponAbilities < ActiveRecord::Migration[7.1]
  def change
    create_table :melee_weapons_weapon_abilities do |t|
      t.references :weapon_ability, null: false, foreign_key: true
      t.references :melee_weapon, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateMeleeWeaponsUnit < ActiveRecord::Migration[7.1]
  def change
    create_table :melee_weapons_units do |t|
      t.references :units, null: false, foreign_key: true
      t.references :melee_weapons, null: false, foreign_key: true

      t.timestamps
    end
  end
end

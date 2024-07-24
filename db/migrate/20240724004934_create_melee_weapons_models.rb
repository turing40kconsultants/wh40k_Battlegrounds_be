class CreateMeleeWeaponsModels < ActiveRecord::Migration[7.1]
  def change
    create_table :melee_weapons do |t|
      t.string :name
      t.integer :attacks
      t.integer :ws
      t.integer :strength
      t.integer :ap 
      t.integer :damage

      t.timestamps
    end
  end
end

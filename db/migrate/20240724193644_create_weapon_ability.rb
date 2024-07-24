class CreateWeaponAbility < ActiveRecord::Migration[7.1]
  def change
    create_table :weapon_abilities do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end

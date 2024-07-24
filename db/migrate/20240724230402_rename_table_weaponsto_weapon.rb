class RenameTableWeaponstoWeapon < ActiveRecord::Migration[7.1]
  def change
    rename_table :weapons, :weapon
  end
end

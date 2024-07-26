class ChangeDamageTypetoStringinWeaponsTable < ActiveRecord::Migration[7.1]
  def change
    change_column :weapons, :damage, :string
  end
end

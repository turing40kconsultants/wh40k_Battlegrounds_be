class AddFactionToUnits < ActiveRecord::Migration[7.1]
  def change
    add_reference :units, :faction, foreign_key: true
  end
end
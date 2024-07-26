class CreateTableFactions < ActiveRecord::Migration[7.1]
  def change
    create_table :table_factions do |t|
      t.string :name
      t.timestamps
    end
  end
end

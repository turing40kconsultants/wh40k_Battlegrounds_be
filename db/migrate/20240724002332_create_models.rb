class CreateModels < ActiveRecord::Migration[7.1]
  def change
    create_table :models do |t|
      t.string :name
      t.integer :movement
      t.integer :toughness
      t.integer :sv
      t.integer :invul_sv
      t.integer :wounds
      t.integer :original_wounds
      t.integer :leadership
      t.integer :objective_control

      t.timestamps
    end
  end
end

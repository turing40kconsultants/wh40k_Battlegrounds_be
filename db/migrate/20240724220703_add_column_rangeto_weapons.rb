class AddColumnRangetoWeapons < ActiveRecord::Migration[7.1]
  def change
    add_column :weapons, :range, :integer
  end
end

class ChangeAttacksColumnTypeInWeapons < ActiveRecord::Migration[7.1]
  def change
    change_column :weapons, :attacks, :string
  end
end

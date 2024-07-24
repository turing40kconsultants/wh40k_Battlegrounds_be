class WeaponAbility < ApplicationRecord
  has_and_belongs_to_many :weapons, join_table: 'weapon_weapon_abilities'


  validates :name, presence: true
  validates :description, presence: true


end

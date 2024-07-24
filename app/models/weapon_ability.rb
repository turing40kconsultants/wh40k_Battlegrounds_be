class WeaponAbility < ApplicationRecord
  has_and_belongs_to_many :melee_weapons, join_table: 'melee_weapons_weapon_abilities'


  validates :name, presence: true
  validates :description, presence: true


end

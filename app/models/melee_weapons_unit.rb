class MeleeWeaponsUnit < ApplicationRecord
  belongs_to :unit
  belongs_to :melee_weapon
end

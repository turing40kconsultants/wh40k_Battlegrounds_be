class MeleeWeapon < ApplicationRecord
  has_and_belongs_to_many :units
  has_and_belongs_to_many :weapon_abilities

  validates :name, presence: true
  validates :attacks, presence: true
  validates :ws, presence: true
  validates :strength, presence: true
  validates :ap, presence: true
  validates :damage, presence: true

  
end
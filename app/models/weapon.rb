class Weapon < ApplicationRecord
  has_many :weapon_units
  has_many :units, through: :weapon_units
  has_many :weapon_weapon_abilities
  has_many :weapon_abilities, through: :weapon_weapon_abilities
  accepts_nested_attributes_for :weapon_abilities

  validates :name, presence: true
  validates :attacks, presence: true
  validates :ws, presence: true
  validates :strength, presence: true
  validates :ap, presence: true
  validates :damage, presence: true
end
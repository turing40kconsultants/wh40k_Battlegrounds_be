class Unit < ApplicationRecord
  # Validations
  validates :name, 
            :movement, 
            :toughness, 
            :sv,
            :wounds, 
            :leadership, 
            :objective_control, 
            presence: true

  # Associations
  has_many :weapon_units
  has_many :weapons, through: :weapon_units
  belongs_to :faction
end

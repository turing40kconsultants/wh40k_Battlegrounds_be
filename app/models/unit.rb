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

  # Instance Methods
  def take_damage
    self.wounds -= 1
    save
  end

  def dead?
    self.wounds <= 0
  end

  def add_ranged_weapon(r_weapon)
    self.ranged_weapons << r_weapon
  end

  def add_melee_weapon(m_weapon)
    self.melee_weapons << m_weapon
  end

  def add_ability(ability_name)
    self.abilities << ability_name
  end
end

class UnitSerializer
  include JSONAPI::Serializer
  attributes :name, :movement, :toughness, :sv, :wounds, :leadership, :objective_control, :faction_id
  
  def self.format_units(units)
    {
      data: 
      units.map do |unit|
        {
          id: unit.id.to_s,
          type: 'unit',
          attributes: {
            name: unit.name,
            movement: unit.movement,
            toughness: unit.toughness,
            sv: unit.sv,
            invul_sv: unit.invul_sv,
            wounds: unit.wounds,
            leadership: unit.leadership,
            objective_control: unit.objective_control,
            faction_id: unit.faction_id
          },
          weapons: {
            data: unit.weapons.map do |weapon| 
              { 
                id: weapon.id.to_s, 
                type: 'weapon',
                attributes: {
                  name: weapon.name,
                  attacks: weapon.attacks,
                  ws: weapon.ws,
                  strength: weapon.strength,
                  ap: weapon.ap,
                  damage: weapon.damage,
                  range: weapon.range
                },
                abilities: {
                  data: weapon.weapon_abilities.map do |ability|
                    {
                      id: ability.id.to_s,
                      type: 'ability',
                      attributes: {
                        name: ability.name,
                        description: ability.description
                      }
                    }
                  end
                }
              }
            end
          }
        }
      end
    }
  end

  def self.format_unit(unit)
    { data: 
          {
            id: unit.id.to_s,
            type: 'unit',
            attributes: {
              name: unit.name,
              movement: unit.movement,
              toughness: unit.toughness,
              sv: unit.sv,
              invul_sv: unit.invul_sv,
              wounds: unit.wounds,
              leadership: unit.leadership,
              objective_control: unit.objective_control,
              faction_id: unit.faction_id
            },
            weapons: {
              data: unit.weapons.map do |weapon| 
                { 
                  id: weapon.id.to_s, 
                  type: 'weapon',
                  attributes: {
                    name: weapon.name,
                    attacks: weapon.attacks,
                    ws: weapon.ws,
                    strength: weapon.strength,
                    ap: weapon.ap,
                    damage: weapon.damage,
                    range: weapon.range
                  },
                  abilities: {
                    data: weapon.weapon_abilities.map do |ability|
                      {
                        id: ability.id.to_s,
                        type: 'ability',
                        attributes: {
                          name: ability.name,
                          description: ability.description
                        }
                      }
                    end
                  }
                }
              end
            }
          }
            }        
          end
    
end
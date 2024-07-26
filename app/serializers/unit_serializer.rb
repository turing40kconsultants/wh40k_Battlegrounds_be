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
            wounds: unit.wounds,
            leadership: unit.leadership,
            objective_control: unit.objective_control,
            faction_id: unit.faction_id
          }
        }
      end
    }
  end
end
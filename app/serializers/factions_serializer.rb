class FactionSerializer
  include JSONAPI::Serializer
  attributes :name
  
  def self.format_factions(factions)
    {
      data: 
      factions.map do |faction|
        {
          id: faction.id.to_s,
          type: 'faction',
          attributes: {
            name: faction.name
          }
        }
      end
    }
  end
end
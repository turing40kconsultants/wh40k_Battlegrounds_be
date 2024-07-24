class UnitFacade
  def initialize

  end
  
  #character
  def get_units_by_faction(faction)
    # search = GithubService.get_units_by_faction("Necrons.cat")
    search = GithubService.get_units_by_faction(faction)
    units = search[:catalogue][:sharedSelectionEntries][:selectionEntry].flat_map do |unit|
      if unit[:type] == "model"
        # binding.pry

        name = unit[:name]

        stats = unit[:profiles][:profile].flat_map do |entry|
          if entry[:typeName] == "Unit"
            entry[:characteristics][:characteristic]
          end
        end.compact
        # character unit
        # melee_weapons = unit[:selectionEntries][:selectionEntry]
        binding.pry
        # squad unit
        melee_weapons = unit[:selectionEntryGroups][:selectionEntryGroup][:selectionEntries][:selectionEntry][:selectionEntryGroups][:selectionEntryGroup][:selectionEntries][:selectionEntry].select do |entry|
          entry[:profiles] && entry[:profiles][:profile][:typeName] == "Melee Weapons"
        end.compact
        
        {
          :name => name,
          :stats => stats,
          :weapons => melee_weapons
        }
        binding.pry
      end
    end
  end
end
class WhFacade
  def initialize

  end
  
  #character
  def get_units_by_faction(faction)
    search = GithubService.get_units_by_faction(faction)
    units = search[:catalogue][:sharedSelectionEntries][:selectionEntry].flat_map do |unit|
      # search[:catalogue][:sharedSelectionEntries][:selectionEntry][34]
      binding.pry
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
        # binding.pry
        # character unit
        weapons =
          if unit[:selectionEntries].is_a?(Hash)
            weapon_profiles = 
              if unit[:selectionEntries][:selectionEntry].is_a?(Hash)
                unit[:selectionEntries][:selectionEntry][:profiles][:profile]
              elsif unit[:selectionEntries][:selectionEntry].is_a?(Array)
                weapon_profiles = unit[:selectionEntries][:selectionEntry].flat_map do |entry|
                  profile = entry[:profiles][:profile]
                  profile = [profile] unless profiles.is_a?(Array)
                end
              end

            weapon_profiles = [weapon_profiles] unless weapon_profiles.is_a?(Array)

            # weapon_profiles.map do |profile| 
            #   { 
            #     name: profile[:name],
            #     typeName: profile[:typeName],
            #     characteristics: profile[:characteristics][:characteristic]
            #   }
            # end
          end
# binding.pry
          if unit[:selectionEntries].is_a?(Array)
            binding.pry
            weapon_profiles = unit[:selectionEntries][:selectionEntry].flat_map do |entry|
              # profile of the weaponb
              # if entry.is_a?(Array)
              profile = entry[:profiles][:profile]
              # profile into an array, some have more that one attack per weapon ex:Nightbringer scythe
              profile = [profile] unless profiles.is_a?(Array)

              # selects only ranged and melee weapons, some are abilities
              profile.select { |profile| ["Ranged Weapons", "Melee Weapons"].include?(profile[:typeName]) }
            end
          end
        
        # weapon_profiles.map do |profile| 
        #   { 
        #     name: profile[:name],
        #     typeName: profile[:typeName],
        #     characteristics: profile[:characteristics][:characteristic]
        #   }
        
        # weapons = 
        # if unit[:selectionEntries]
        #   unit[:selectionEntries][:selectionEntry].map do |weapon|
        #     {
        #       :weapon_name => weapon[:profiles][:profile][:name],
        #       :typeName => weapon[:profiles][:profile][:typeName],
        #       :characteristics => weapon[:profiles][:profile][:characteristics][:characteristic]
        #     }
        #   end

        # else
        #   unit[:selectionEntryGroups][:selectionEntryGroup][:selectionEntries][:selectionEntry][:selectionEntryGroups][:selectionEntryGroup][:selectionEntries][:selectionEntry].select do |entry|
        #     entry[:profiles] && entry[:profiles][:profile][:typeName] == "Melee Weapons"
        #   end
        # end.compact
        
        # {
        #   :name => name,
        #   :stats => stats,
        #   :weapons => weapons
        # }
        # binding.pry
      end
    end
  end
end
class WhFacade
  def initialize

  end
  
  #character
  def get_units_by_faction(faction)
    search = GithubService.get_units_by_faction(faction)
    units = search[:catalogue][:sharedSelectionEntries][:selectionEntry].flat_map do |unit|
#       if unit[:type] == "unit"
#         name = unit[:name]
#         stats = unit[:profiles][:profile].flat_map do |entry|
#           entry[:characteristics][:characteristic] if entry[:typeName] == "Unit"
#         end.compact
#         # binding.pry
#         weapon_profiles = []


#         profile = unit[:selectionEntryGroups][:selectionEntryGroup][:selectionEntries][:selectionEntry]
# binding.pry
#         if profile.is_a?(Array)
#           profile.each do |entry|
#             # binding.pry
#             weapon_profiles << entry[:selectionEntries][:selectionEntry][:profiles][:profile]
#           end
#           # binding.pry
#         elsif profile[:selectionEntryGroups]
#           profile[:selectionEntryGroups][:selectionEntryGroup][:selectionEntries][:selectionEntry].each do |group|
#             weapon_profiles << group[:profiles][:profile] if group[:profiles][:profile].is_a?(Hash)
#             if group[:profiles][:profile].is_a?(Array)
#               group[:profiles][:profile].each do |weapon|
#                 weapon_profiles << weapon
#               end
#             end
#           end
#             # group[:selectionEntries][:selectionEntry]
#         # end

#         elsif profile[:selectionEntries][:selectionEntry].is_a?(Hash)
#           # binding.pry
#           weapon_profiles << profile[:selectionEntries][:selectionEntry][:profiles][:profile]
#         elsif profile[:selectionEntries][:selectionEntry].is_a?(Array)
#           profile[:selectionEntries][:selectionEntry].each do |entry|
#             weapon_profiles << entry[:profiles][:profile] if entry[:profiles][:profile].is_a?(Hash)
#             if entry[:profiles][:profile].is_a?(Array)
#               entry[:profiles][:profile].each do |weapon|
#                 weapon_profiles << weapon
#               end
#             end
#           end
#         elsif profile[:selectionEntryGroups][:selectionEntryGroup][:selectionEntries][:selectionEntry].each do |entry|
#           binding.pry
#           weapon_profiles << entry[:profiles][:profile] if entry[:profiles][:profile].is_a?(Hash)
#             if entry[:profiles][:profile].is_a?(Array)
#               entry[:profiles][:profile].each do |weapon|
#                 weapon_profiles << weapon
#               end
#             end
#           end
#         end

#         weapons = weapon_profiles.map do |profile| 
#           { 
#             name: profile[:name],
#             typeName: profile[:typeName],
#             characteristics: profile[:characteristics][:characteristic]
#           }
#         end

#         {
#           :name => name,
#           :stats => stats,
#           :weapons => weapons
#         }
#       end

      if unit[:type] == "model"

        name = unit[:name]

        stats = unit[:profiles][:profile].flat_map do |entry|
          entry[:characteristics][:characteristic] if entry[:typeName] == "Unit"
        end.compact

        weapons =
        # *******selectionEntryGroups has attacks
          if unit[:selectionEntries].is_a?(Hash)
            weapon_profiles = 
              if unit[:selectionEntries][:selectionEntry].is_a?(Hash)
                unit[:selectionEntries][:selectionEntry][:profiles][:profile]
              elsif unit[:selectionEntries][:selectionEntry].is_a?(Array)
                unit[:selectionEntries][:selectionEntry].flat_map do |entry|
                  if entry[:profiles][:profile].is_a?(Hash)
                    entry[:profiles][:profile]

                  elsif entry[:profiles][:profile].is_a?(Array)
                    entry[:profiles][:profile]
                  end
                end
              end
            weapon_profiles = [weapon_profiles] if weapon_profiles.is_a?(Hash)
            weapon_profiles.map do |profile| 
              { 
                name: profile[:name],
                typeName: profile[:typeName],
                characteristics: profile[:characteristics][:characteristic]
              }
            end
          end
          # binding.pry
                      

          # if unit[:selectionEntries].is_a?(Array)
          #   binding.pry
          #   weapon_profiles = unit[:selectionEntries][:selectionEntry].flat_map do |entry|
          #     # profile of the weaponb
          #     # if entry.is_a?(Array)
          #     profile = entry[:profiles][:profile]
          #     # profile into an array, some have more that one attack per weapon ex:Nightbringer scythe
          #     profile = [profile] unless profile.is_a?(Array)

          #     # selects only ranged and melee weapons, some are abilities
          #     profile.select { |profile| ["Ranged Weapons", "Melee Weapons"].include?(profile[:typeName]) }
          #   end
          #   # weapon_profiles.map do |profile| 
          #   #   { 
          #   #     name: profile[:name],
          #   #     typeName: profile[:typeName],
          #   #     characteristics: profile[:characteristics][:characteristic]
          #   #   }
          #   # end
          # end

        {
          :name => name,
          :stats => stats,
          :weapons => weapons
        }
      end
    end
  end
end
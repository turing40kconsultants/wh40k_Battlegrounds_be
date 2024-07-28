class WhFacade
  def initialize

  end
  
  def get_units_by_faction(faction)
    search = GithubService.get_units_by_faction(faction)
    units = search[:catalogue][:sharedSelectionEntries][:selectionEntry].flat_map do |unit|
      collection = []

      if unit[:type] == "unit"

        name = unit[:name]

        stats = 
          if unit[:profiles][:profile].is_a?(Hash)
            unit[:profiles][:profile][:characteristics][:characteristic]
          else
            stat_data =
            unit[:profiles][:profile].find do |entry|
              entry[:typeName] == "Unit"
            end
            if stat_data
              stat_data[:characteristics][:characteristic]
            else
              if unit[:selectionEntryGroups]
                if unit[:selectionEntryGroups][:selectionEntryGroup].is_a?(Hash)
                  unit[:selectionEntryGroups][:selectionEntryGroup][:selectionEntries][:selectionEntry][0][:profiles][:profile][:characteristics][:characteristic]
                else
                  unit[:selectionEntryGroups][:selectionEntryGroup][0][:selectionEntries][:selectionEntry][0][:profiles][:profile][:characteristics][:characteristic]
                end
              else
                unit[:selectionEntries][:selectionEntry][0][:profiles][:profile][:characteristics][:characteristic]
              end
            end
          end

        weapon_profiles = []

        if unit[:selectionEntries]
          if unit[:selectionEntries][:selectionEntry].is_a?(Array)
            unit[:selectionEntries][:selectionEntry].each do |entry|
              entry[:selectionEntries][:selectionEntry].each do |entry|
                weapon_profiles << entry[:profiles][:profile]
                
              end
            end
          elsif unit[:selectionEntries][:selectionEntry].is_a?(Hash) && unit[:selectionEntries][:selectionEntry][:selectionEntries]
            if unit[:selectionEntries][:selectionEntry][:selectionEntries][:selectionEntry].is_a?(Hash)
              weapon_profiles << unit[:selectionEntries][:selectionEntry][:selectionEntries][:selectionEntry][:profiles][:profile]
            elsif unit[:selectionEntries][:selectionEntry][:selectionEntries][:selectionEntry].is_a?(Array)
              unit[:selectionEntries][:selectionEntry][:selectionEntries][:selectionEntry].each do |entry|
                if entry[:profiles]
                weapon_profiles << entry[:profiles][:profile] if entry[:profiles][:profile].is_a?(Hash)
                  if entry[:profiles][:profile].is_a?(Array)
                    entry[:profiles][:profile].each do |weapon|
                      weapon_profiles << weapon
                    end
                  end
                elsif entry[:selectionEntries]
                  weapon_profiles << entry[:selectionEntries][:selectionEntry][:profiles][:profile]
                end
              end
            end
          end
        end

        if unit[:selectionEntryGroups]
          if unit[:selectionEntryGroups][:selectionEntryGroup].is_a?(Array)
            unit[:selectionEntryGroups][:selectionEntryGroup][1][:selectionEntries][:selectionEntry].each do |entry|
              weapon_profiles << entry[:profiles][:profile]
            end
          elsif unit[:selectionEntryGroups][:selectionEntryGroup].is_a?(Hash)
            profile = unit[:selectionEntryGroups][:selectionEntryGroup][:selectionEntries][:selectionEntry]
            if profile.is_a?(Array)
              profile.each do |entry|
                if entry[:selectionEntries]
                  if entry[:selectionEntries][:selectionEntry].is_a?(Hash)
                    weapon_profiles << entry[:selectionEntries][:selectionEntry][:profiles][:profile]
                  else
                    entry[:selectionEntries][:selectionEntry].each do |nested_entry|
                      weapon_profiles << nested_entry[:profiles][:profile]
                    end
                  end
                end
              end
            elsif profile[:selectionEntryGroups]
              if profile[:selectionEntryGroups][:selectionEntryGroup].is_a?(Array)
                profile[:selectionEntryGroups][:selectionEntryGroup].each do |group|
                  group[:selectionEntries][:selectionEntry].each do |nested_entry|
                    weapon_profiles << nested_entry[:profiles][:profile] if nested_entry[:profiles][:profile].is_a?(Hash)
                  end
                end
              else
                profile[:selectionEntryGroups][:selectionEntryGroup][:selectionEntries][:selectionEntry].each do |group|
                  weapon_profiles << group[:profiles][:profile] if group[:profiles][:profile].is_a?(Hash)
                  if group[:profiles][:profile].is_a?(Array)
                    group[:profiles][:profile].each do |weapon|
                      weapon_profiles << weapon
                    end
                  end
                end
              end
            elsif profile[:selectionEntries][:selectionEntry].is_a?(Hash)
              weapon_profiles << profile[:selectionEntries][:selectionEntry][:profiles][:profile]
            elsif profile[:selectionEntries][:selectionEntry].is_a?(Array)
              profile[:selectionEntries][:selectionEntry].each do |entry|
                weapon_profiles << entry[:profiles][:profile] if entry[:profiles][:profile].is_a?(Hash)
                if entry[:profiles][:profile].is_a?(Array)
                  entry[:profiles][:profile].each do |weapon|
                    weapon_profiles << weapon
                  end
                end
              end
            elsif profile[:selectionEntryGroups][:selectionEntryGroup][:selectionEntries][:selectionEntry].each do |entry|
              weapon_profiles << entry[:profiles][:profile] if entry[:profiles][:profile].is_a?(Hash)
                if entry[:profiles][:profile].is_a?(Array)
                  entry[:profiles][:profile].each do |weapon|
                    weapon_profiles << weapon
                  end
                end
              end
            end
          end
        end

        weapons = weapon_profiles.flatten.map do |profile| 
          { 
            name: profile[:name],
            typeName: profile[:typeName],
            characteristics: profile[:characteristics][:characteristic]
          }
        end.uniq

        collection << {
          :name => name,
          :stats => stats,
          :weapons => weapons
        }
        # if weapons == nil || weapons.empty?
        #   binding.pry
        # end

        # if stats == nil
        #   binding.pry
        # end
      end
# ================================================================
      if unit[:type] == "model"

        name = unit[:name]

        stats = unit[:profiles][:profile].flat_map do |entry|
          entry[:characteristics][:characteristic] if entry[:typeName] == "Unit"
        end.compact

        weapon_profiles = []
        if unit[:selectionEntries].is_a?(Hash)
          if unit[:selectionEntries][:selectionEntry].is_a?(Hash)
            if unit[:selectionEntries][:selectionEntry][:profiles][:profile].is_a?(Hash)
              weapon_profiles << unit[:selectionEntries][:selectionEntry][:profiles][:profile]
            elsif unit[:selectionEntries][:selectionEntry][:profiles][:profile].is_a?(Array)
              unit[:selectionEntries][:selectionEntry][:profiles][:profile].each do |profile|
                weapon_profiles << profile
              end
            end
          elsif unit[:selectionEntries][:selectionEntry].is_a?(Array)
            unit[:selectionEntries][:selectionEntry].each do |entry|
              if entry[:profiles][:profile].is_a?(Hash)
                weapon_profiles << entry[:profiles][:profile]
              elsif entry[:profiles][:profile].is_a?(Array)
                entry[:profiles][:profile].each do |profile|
                  weapon_profiles << profile
                end
              end
            end
          end
        elsif unit[:selectionEntryGroups]
          if unit[:selectionEntryGroups][:selectionEntryGroup].is_a?(Array)
            unit[:selectionEntryGroups][:selectionEntryGroup].each do |group|
              if group[:selectionEntries][:selectionEntry].is_a?(Array)
                group[:selectionEntries][:selectionEntry].each do |entry|
                  if entry[:profiles][:profile].is_a?(Hash)
                    weapon_profiles << entry[:profiles][:profile]
                  elsif entry[:profiles][:profile].is_a?(Array)
                    entry[:profiles][:profile].each do |profile|
                      weapon_profiles << profile
                    end
                  end
                end
              elsif group[:selectionEntries][:selectionEntry].is_a?(Hash)
                if group[:selectionEntries][:selectionEntry][:profiles][:profile].is_a?(Hash)
                  weapon_profiles << group[:selectionEntries][:selectionEntry][:profiles][:profile]
                elsif group[:selectionEntries][:selectionEntry][:profiles][:profile].is_a?(Array)
                  group[:selectionEntries][:selectionEntry][:profiles][:profile].each do |profile|
                    weapon_profiles << profile
                  end
                end
              end
            end
          elsif unit[:selectionEntryGroups][:selectionEntryGroup].is_a?(Hash)
            if unit[:selectionEntryGroups][:selectionEntryGroup][:selectionEntries][:selectionEntry].is_a?(Array)
              unit[:selectionEntryGroups][:selectionEntryGroup][:selectionEntries][:selectionEntry].each do |entry|
                if entry[:profiles]
                  if entry[:profiles][:profile].is_a?(Hash)
                    weapon_profiles << entry[:profiles][:profile]
                  elsif entry[:profiles][:profile].is_a?(Array)
                    entry[:profiles][:profile].each do |profile|
                      weapon_profiles << profile
                    end
                  end
                end
              end
            elsif unit[:selectionEntryGroups][:selectionEntryGroup][:selectionEntries][:selectionEntry].is_a?(Hash)
              if unit[:selectionEntryGroups][:selectionEntryGroup][:selectionEntries][:selectionEntry][:selectionEntries][:selectionEntry].is_a?(Array)
                unit[:selectionEntryGroups][:selectionEntryGroup][:selectionEntries][:selectionEntry][:selectionEntries][:selectionEntry].each do |entry|
                  if entry[:profiles]
                    if entry[:profiles][:profile].is_a?(Hash)
                      weapon_profiles << entry[:profiles][:profile]
                    elsif entry[:profiles][:profile].is_a?(Array)
                      entry[:profiles][:profile].each do |profile|
                        weapon_profiles << profile
                      end
                    end
                  end
                end
              end
            end
          end
        end

        weapons = weapon_profiles.map do |profile| 
          { 
            name: profile[:name],
            typeName: profile[:typeName],
            characteristics: profile[:characteristics][:characteristic]
          }
        end

        collection << {
          :name => name,
          :stats => stats,
          :weapons => weapons
        }
        # if weapons == nil || weapons.empty?
        #   binding.pry
        # end
        
        # if stats == nil
        #   binding.pry
        # end
      end
      collection
    end
  end
end

# trying to create helper method to iterate and file profiles
# def dig_selection_entries(entries)
# entry_hash = 
#             if entries[:selectionEntry].is_a?(Hash)
#               [entries[:selectionEntry]]
#             else
#               entry[:selectionEntry]
#             end
#   entry_hash[:selectionEntry].each do |entry|
#     if entry[:type] == "model" || entry[:type] == "unit"
#       ....
#     end
#   end
# end

# def find_profiles(data)
#   entry = []
#   if data[:selectionEntries]
#     data[:selectionEntries][:selectionEntry].
#   end
#   until entry[:profiles]
#   end
# end

{:name=>"Lychguard",
:stats=>["5\"", "5", "3+", "2", "7+", "1"],
:weapons=>
  [{:name=>"Warscythe", :typeName=>"Melee Weapons", :characteristics=>["Melee", "2", "3+", "8", "-3", "2", "Devastating Wounds"]},
  {:name=>"Hyperphase sword", :typeName=>"Melee Weapons", :characteristics=>["Melee", "3", "3+", "6", "-2", "1", "-"]},
  {:name=>"Dispersion Shield", :typeName=>"Abilities", :characteristics=>"The bearer has a 4+ invulnerable save."}]}

def reformat_weapon_data(weapon_list)
    weapon_list.map do |weapon|
      weapon[:characteristics]
    end
  # end
end
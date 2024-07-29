class WhFacade
  def initialize

  end
  
  def get_units_by_faction(faction)
    search = GithubService.get_units_by_faction(faction)
    units = search[:catalogue][:sharedSelectionEntries][:selectionEntry].flat_map do |unit|
      collection = []
      # binding.pry

      if unit[:type] == "unit"

        name = unit[:name]

        stats = 
          if unit[:profiles][:profile].is_a?(Hash)
            unit[:selectionEntryGroups][:selectionEntryGroup][:selectionEntries][:selectionEntry][:profiles][:profile][:characteristics][:characteristic]
          else
            #to here
            unit[:profiles][:profile].flat_map do |entry|
            entry[:characteristics][:characteristic] if entry[:typeName] == "Unit"
            end
          end.compact

        weapon_profiles = []

        if unit[:selectionEntries]
          if unit[:selectionEntries][:selectionEntry].is_a?(Array)
            unit[:selectionEntries][:selectionEntry].each do |entry|
              entry[:selectionEntries][:selectionEntry].each do |entry|
                weapon_profiles << entry[:profiles][:profile]
                
              end
            end

          elsif unit[:selectionEntries][:selectionEntry].is_a?(Hash)
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
          profile = unit[:selectionEntryGroups][:selectionEntryGroup][:selectionEntries][:selectionEntry]
          if profile.is_a?(Array)
            profile.each do |entry|
              if entry[:selectionEntries]
                weapon_profiles << entry[:selectionEntries][:selectionEntry][:profiles][:profile]
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
      end
# ================================================================
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

        collection << {
          :name => name,
          :stats => stats,
          :weapons => weapons
        }
      end
      collection
    end
  end

  def get_dark_angels(faction)
    search = GithubService.get_units_by_faction(faction)
    data = search[:catalogue][:sharedSelectionEntries][:selectionEntry]
    collection = find_all_by_key_iterative(data, :profile)
  end

  def find_all_by_key_iterative(hash, target_key)
    result = []
    stack = [hash]
  
    until stack.empty?
      current = stack.pop
      if current.is_a?(Hash)
        current.each do |key, value|
          result << value if key == target_key
          stack << value if value.is_a?(Hash) || value.is_a?(Array)
        end
      elsif current.is_a?(Array)
        current.each { |element| stack << element if element.is_a?(Hash) }
      end
    end
  
    result
  end
end
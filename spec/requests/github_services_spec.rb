require 'rails_helper'

describe GithubService do
  context "class methods" do
    context "#get_units_by_faction" do
      it "returns unit data" do
        search = GithubService.get_units_by_faction("Necrons.cat")

        expect(search).to be_a Hash
        expect(search[:catalogue][:sharedSelectionEntries][:selectionEntry]).to be_an Array

        # objects = search[:catalogue][:sharedSelectionEntries][:selectionEntry].flat_map do |object|
        #   if object[:type] == "model"
        #     # binding.pry

        #     name = object[:name]

        #     stats = object[:profiles][:profile].flat_map do |entry|
        #       if entry[:typeName] == "Unit"
        #         entry[:characteristics][:characteristic]
        #       end
        #     end.compact

        #     # weapons = object[:selectionEntries][:selectionEntry]
        #     binding.pry
        #     melee_weapons = object[:selectionEntryGroups][:selectionEntryGroup][:selectionEntries][:selectionEntry][:selectionEntryGroups][:selectionEntryGroup][:selectionEntries][:selectionEntry].select do |entry|
        #       entry[:profiles] && entry[:profiles][:profile][:typeName] == "Melee Weapons"
        #     end
            
        #     # .map do |entry|
        #     #   {
        #     #     name: entry[:profiles][:profile][:name],
        #     #     stats: entry[:profiles][:profile][:characteristics][:characteristic]
        #     #   }
        #     # end
        #     {
        #       :name => name,
        #       :stats => stats,
        #       :weapons => melee_weapons
        #     }
        #   end
        # end.compact
        # binding.pry


      end
    end
  end
end
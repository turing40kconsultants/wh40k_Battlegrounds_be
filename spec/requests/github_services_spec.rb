require 'rails_helper'

describe GithubService do
  context "class methods" do
    context "#get_units_by_faction" do
      it "returns unit data" do
        search = GithubService.get_units_by_faction("Necrons.cat")

        expect(search).to be_a Hash
        expect(search[:catalogue][:sharedSelectionEntries][:selectionEntry]).to be_an Array

      end
    end
  end
end
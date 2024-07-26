require 'rails_helper'

describe WhFacade do
  context "#get_units_by_faction" do
    it "can create Necron units with hash data from GithubService", :vcr do
      response = WhFacade.new.get_units_by_faction("Necrons.cat")

      expect(response).to be_an Array
      # binding.pry
      # expect(response).to be_all Unit
    end

    it "can create Dark Angels units with hash data from GithubService", :vcr do
      response = WhFacade.new.get_units_by_faction("Imperium%20-%20Dark%20Angels.cat")

      expect(response).to be_an Array
      binding.pry
      # expect(response).to be_all Unit
    end
  end
end

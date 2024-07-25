require 'rails_helper'

describe WhFacade do
  context "#get_units_by_faction" do
    it "can create units with hash data from GithubService", :vcr do
      response = WhFacade.new.get_units_by_faction("Necrons.cat")

      expect(response).to be_an Array
      binding.pry
      expect(response).to be_all Unit
    end
  end
end

require 'rails_helper'

RSpec.describe Faction, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should have_many(:units) }
  end

  describe '.find_by_name' do
    before do
      @faction1 = Faction.create(name: 'Alpha Legion')
      @faction2 = Faction.create(name: 'Blood Angels')
      @faction3 = Faction.create(name: 'Dark Angels')
    end

    it 'returns the first faction matching the name case insensitively' do
      result = Faction.find_by_name('blood')
      expect(result).to eq(@faction2)
    end

    it 'returns the first faction in alphabetical order if multiple matches are found' do
      Faction.create(name: 'Blood Drinkers')
      result = Faction.find_by_name('blood')
      expect(result).to eq(@faction2) # Blood Angels should come before Blood Drinkers
    end

    it 'returns nil if no faction matches the name' do
      result = Faction.find_by_name('Ultramarines')
      expect(result).to be_nil
    end
  end
end
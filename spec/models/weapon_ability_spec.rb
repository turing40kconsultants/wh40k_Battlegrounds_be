require 'rails_helper'

RSpec.describe WeaponAbility, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
  end

  describe 'associations' do
    it { should have_and_belong_to_many(:weapons) }
  end

  describe 'initialize' do
    it 'should initialize a weapon ability with a name and description' do
      lh = WeaponAbility.create(name: 'Lethal Hits', description: 'Critical hits automatically wound')

      expect(lh.name).to eq('Lethal Hits')
      expect(lh.description).to eq('Critical hits automatically wound')
    end
  end
end

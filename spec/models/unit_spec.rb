require 'rails_helper'

RSpec.describe Unit, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:movement) }
    it { should validate_presence_of(:toughness) }
    it { should validate_presence_of(:sv) }
    it { should validate_presence_of(:wounds) }
    it { should validate_presence_of(:leadership) }
    it { should validate_presence_of(:objective_control) }
  end

  describe 'associations' do
    it { should have_many(:weapon_units) }
    it { should have_many(:weapons).through(:weapon_units) }
    it { should belong_to(:faction) }
  end

  before(:each) do
    @uriel_v = Unit.create(name: 'Uriel Ventris', movement: 6, toughness: 4, sv: 3, wounds: 5, leadership: 6, objective_control: 1, invul_sv: 4)
    @cultist = Unit.create(name: 'Cultist Mob', movement: 6, toughness: 3, sv: 6, wounds: 1, leadership: 7, objective_control: 1, invul_sv: nil)
    @chaos_sm = Unit.create(name: 'Chaos Space Marine', movement: 6, toughness: 4, sv: 3, wounds: 2, leadership: 6, objective_control: 2, invul_sv: nil)
    @terminator = Unit.create(name: 'Terminator', movement: 5, toughness: 5, sv: 2, wounds: 3, leadership: 6, objective_control: 1, invul_sv: 4)
  end

  describe 'initialize' do
    it 'should initialize a unit with a name, movement, toughness, sv, wounds, and objective_control' do
      unit = @uriel_v
      expect(unit.name).to eq('Uriel Ventris')
      expect(unit.movement).to eq(6)
      expect(unit.toughness).to eq(4)
      expect(unit.sv).to eq(3)
      expect(unit.wounds).to eq(5)
      expect(unit.leadership).to eq(6)
      expect(unit.objective_control).to eq(1)
      expect(unit.invul_sv).to eq(4)
    end
  end
end
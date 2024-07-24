require 'rails_helper'

RSpec.describe MeleeWeapon, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:attacks) }
    it { should validate_presence_of(:ws) }
    it { should validate_presence_of(:strength) }
    it { should validate_presence_of(:ap) }
    it { should validate_presence_of(:damage) }
  end

  describe 'associations' do
    it { should have_and_belong_to_many(:units) }
    it { should have_and_belong_to_many(:weapon_abilities) }
  end

  describe 'initialize' do
    it 'should initialize a melee weapon with a name, attacks, ws, strength, ap, and damage' do
      m_weapon = MeleeWeapon.create(name: 'Master Crafted Power Sword', attacks: 4, ws: 3, strength: 5, ap: 2, damage: 2)
      expect(m_weapon.name).to eq('Master Crafted Power Sword')
      expect(m_weapon.attacks).to eq(4)
      expect(m_weapon.ws).to eq(3)
      expect(m_weapon.strength).to eq(5)
      expect(m_weapon.ap).to eq(2)
      expect(m_weapon.damage).to eq(2)
  end
end

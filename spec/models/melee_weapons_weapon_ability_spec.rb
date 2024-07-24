require 'rails_helper'

RSpec.describe MeleeWeaponsWeaponAbility, type: :model do
  describe 'associations' do
    it { should belong_to(:weapon_ability) }
    it { should belong_to(:melee_weapon) }
  end
end

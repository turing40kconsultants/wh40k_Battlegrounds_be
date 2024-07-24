require 'rails_helper'

RSpec.describe WeaponWeaponAbility, type: :model do
  describe 'associations' do
    it { should belong_to(:weapon_ability) }
    it { should belong_to(:weapon) }
  end
end

require 'rails_helper'

RSpec.describe MeleeWeaponsUnit, type: :model do
  describe 'associations' do
    it { should belong_to(:unit) }
    it { should belong_to(:melee_weapon) }
  end
end

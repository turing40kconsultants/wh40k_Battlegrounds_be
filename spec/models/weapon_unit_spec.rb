require 'rails_helper'

RSpec.describe WeaponUnit, type: :model do
  describe 'associations' do
    it { should belong_to(:unit) }
    it { should belong_to(:weapon) }
  end
end

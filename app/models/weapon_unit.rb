class WeaponUnit < ApplicationRecord
  belongs_to :unit
  belongs_to :weapon
end

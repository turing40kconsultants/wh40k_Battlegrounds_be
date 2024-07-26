class Faction < ApplicationRecord
  has_many :units

  validates :name, presence: true
end
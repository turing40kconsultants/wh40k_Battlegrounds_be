class Faction < ApplicationRecord
  has_many :units
  belongs_to :faction

  validates :name, presence: true
end
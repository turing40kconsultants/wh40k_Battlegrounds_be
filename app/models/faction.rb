class Faction < ApplicationRecord
  has_many :units

  validates :name, presence: true

  def self.find_by_name(name)
    self.where("name ILIKE ?", "%#{name}%")
        .order(name: :asc)
        .first
  end
end
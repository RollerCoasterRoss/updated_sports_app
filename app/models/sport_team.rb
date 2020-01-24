class SportTeam < ApplicationRecord
  validates :team_name, presence: true
  validates :team_name, format: { with: /\A[A-Z0-9\s]+\z/i }
  validates :city_region, presence: true
  validates :city_region, format: { with: /\A[A-Z]+\z/i }
  validates :market_size, presence: true
  validates :market_size, inclusion: { in: %w(Small Medium Large) }
  validates :fanbase_loyalty, presence: true
  validates :fanbase_loyalty, inclusion: { in: 0..10 }
  validates :fanbase_loyalty, numericality: { only_integer: true }
  validates :sport_type, presence: true
  validates :notable_player, presence: true
  validates :additional_info, length: { maximum: 250 }
end

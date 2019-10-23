class League < ApplicationRecord
  LEAGUE_PARAMS = %i(name country).freeze
  
  has_many :seasons, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :country, presence: true
end

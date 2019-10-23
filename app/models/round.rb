class Round < ApplicationRecord
  ROUND_PARAMS = %i(round_number season_id).freeze

  belongs_to :season
  has_many :matches, dependent: :destroy

  delegate :start_time, to: :season, prefix: true
  delegate :finish_time, to: :season, prefix: true
end

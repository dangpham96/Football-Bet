class Player < ApplicationRecord
  PLAYER_PARAMS = %i(name position number country birthday football_club_id).freeze
  enum position: {gk: 1, sw: 2, cb: 3, rb: 4, lb: 5, cdm: 6, cm: 7, cam: 8, lm: 9, rm: 10, lf: 11, rf: 12, cf: 13, st: 14}
  
  belongs_to :football_club

  validates :name, presence: true
  validates :position, presence: true
  validates :number, presence: true

   delegate :name, to: :football_club, prefix:true
end

class Match < ApplicationRecord
  after_update :resule_match_for_bet, if: -> {self.fought?}
  MATCH_PARAMS = %i(home_team_id guest_team_id start_time finish_time goals_home_team goals_guest_team round_id status).freeze
  enum status: {unfought: 0, fighting: 1, fought: 2}

  belongs_to :round
  belongs_to :home_team, class_name: FootballClub.name
  belongs_to :guest_team, class_name: FootballClub.name
  has_many :bets, dependent: :destroy

  delegate :round_number, to: :round, prefix: true

  def resule_match_for_bet
    result = goals_home_team - goals_guest_team
    self.bets.each do |bet|
      if (bet.win? && result > 0) || (bet.lost? && result < 0) || (bet.draw? && result == 0)
        bet.exactly!
      else
        bet.incorrect!
      end
    end
  end
end

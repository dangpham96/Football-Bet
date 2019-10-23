class Bet < ApplicationRecord
  after_create_commit :set_default_result_bet
  BET_PARAMS = %i(user_id match_id result status).freeze
  enum status: {incorrect: 0, exactly: 1, waiting: 2}
  enum result: {lost: 0, draw: 1, win: 2}

  belongs_to :user
  belongs_to :match

  validates :result, presence: true

  scope :by_user_and_bet, ->(user_id, match_id){where user_id: user_id, match_id: match_id}

  def set_default_result_bet
    self.update_attributes status: :waiting
  end
end

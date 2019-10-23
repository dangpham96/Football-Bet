class MatchsController < ApplicationController
  before_action :load_match, except: %i(new create index)
  before_action :load_leagues
  before_action :load_league

  def index        
    if @league
      @season = Season.includes(:rounds).find_by id: params[:season]
      if @season
        @rounds = @season.rounds
        @round = Round.find_by id: params[:round]
        @matches = @round.matches if @round
      end
    end
    respond_to do |format|
      format.js
      format.html
    end
  end

  private

  def load_leagues
    @leagues = League.all
  end

  def load_league
    @league = League.includes(:seasons).find_by id: params[:league]
  end

  def show
    @bet = Bet.new
  end

  def load_match
    @match = Match.find_by id: params[:id]
    return if @match
    flash[:danger] = t "error"
    redirect_to root_path
  end
end

class BetsController < ApplicationController
  before_action :load_bet, except: %i(new create index)
  
  def index; end

  def new
    @bet = Bet.new
  end

  def create
    @bet = Bet.new bet_params

    if @bet.save
      flash[:success] = t "success"
      redirect_to request.referrer
    end
  end

  private
  
  def bet_params
    params.require(:bet).permit Bet::BET_PARAMS
  end

  def load_bet
    @bet = Bet.find_by id: params[:id]

    return if @bet
    flash[:danger] = t "error"
    redirect_to root_path
  end
end

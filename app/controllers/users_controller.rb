class UsersController < ApplicationController
  before_action :find_user, only: %i(show)

  def show
    @show_bet = Bet.where(user_id: @user.id).page(params[:page]).per Settings.paging_table_bet
  end

  private

  def find_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "error"
    redirect_to root_path
  end
end

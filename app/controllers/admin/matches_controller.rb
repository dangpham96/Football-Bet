class Admin::MatchesController < AdminController
  before_action :load_round_by_id
  before_action :load_match, except: %i(new create index)

  def index
    @matches = @round.matches.page(params[:page]).per Settings.paging_table
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new match_params

    if @match.save
      flash[:success] = t("success")
      redirect_to admin_round_matches_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @match.update match_params
      flash[:success] =  t "success"
      redirect_to admin_round_matches_path
    else
      render :edit
    end
  end

  def destroy
    if @match.destroy
      flash[:success] = t "success"
    else
      flash[:danger] = t "error"
    end
    redirect_to admin_round_matches_path
  end

  private

  def match_params
    params.require(:match).permit Match::MATCH_PARAMS
  end

  def load_match
    @match = Match.find_by id: params[:id]

    return if @match
    flash[:danger] = t "error"
    redirect_to root_path
  end

  def load_round_by_id
    @round = Round.find_by id: params[:round_id]
  end
end

class Admin::SeasonsController < AdminController
  before_action :load_season, except: %i(new create index)

  def index
    @seasons = Season.page(params[:page]).per Settings.paging_table
  end

  def new
    @season = Season.new
  end

  def create
    @season = Season.new season_params

    params[:season][:football_clubs].each do |football_club_id|
      @season.rankings.build(football_club_id: football_club_id)
    end

    if @season.save
      flash[:success] = t("success")
      redirect_to admin_seasons_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @season.update season_params
      flash[:success] =  t "success"
      redirect_to admin_seasons_path
    else
      render :edit
    end
  end

  def destroy
    if @season.destroy
      flash[:success] = t "success"
    else
      flash[:danger] = t "error"
    end
    redirect_to admin_seasons_path
  end

  private
  
  def season_params
    params.require(:season).permit Season::SEASON_PARAMS
  end

  def load_season
    @season = Season.find_by id: params[:id]

    return if @season
    flash[:danger] = t "error"
    redirect_to root_path
  end
end

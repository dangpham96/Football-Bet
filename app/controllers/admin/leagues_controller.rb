class Admin::LeaguesController < AdminController
  before_action :load_league, except: %i(new create index)

  def index
    @leagues = League.page(params[:page]).per Settings.paging_table
  end

  def new
    @league = League.new
  end

  def create
    @league = League.new league_params

    if @league.save
      flash[:success] = t("success")
      redirect_to admin_leagues_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @league.update league_params
      flash[:success] =  t "success"
      redirect_to admin_leagues_path
    else
      render :edit
    end
  end

  def destroy
    if @league.destroy
      flash[:success] = t "success"
    else
      flash[:danger] = t "error"
    end
    redirect_to admin_leagues_path
  end

  private
  
  def league_params
    params.require(:league).permit League::LEAGUE_PARAMS
  end

  def load_league
    @league = League.find_by id: params[:id]

    return if @league
    flash[:danger] = t "error"
    redirect_to root_path
  end
end

class Admin::FootballClubsController < AdminController
  before_action :load_football_club, except: %i(new create index)

  def index
    @football_clubs = FootballClub.page(params[:page]).per Settings.paging_table
  end

  def new
    @football_club = FootballClub.new
  end

  def create
    @football_club = FootballClub.new football_club_param

    if @football_club.save
      flash[:success] = t "success"
      redirect_to admin_footballs_clubs_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @football_club.update football_club_param
      flash[:success] =  t "success"
      redirect_to admin_football_clubs_path
    else
      render :edit
    end
  end

  def destroy
    if @football_club.destroy
      flash[:success] = t "success"
    else
      flash[:danger] = t "error"
    end
    redirect_to admin_football_clubs_path
  end

  private

  def football_club_param
    params.require(:football_club).permit FootballClub::FOOTBALL_CLUB_PARAMS
  end

  def load_football_club
    @football_club = FootballClub.find_by id: params[:id]

    return if @football_club
    flash[:danger] = t "error"
    redirect_to root_path
  end
end

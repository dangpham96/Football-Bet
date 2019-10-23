class Admin::PlayersController < AdminController
  before_action :load_player, except: %i(new create index)

   def index
    @players = Player.page(params[:page]).per Settings.paging_table
  end

   def new
    @player = Player.new
  end

   def create
    @player = Player.new player_params

    if @player.save
      flash[:success] = t("success")
      redirect_to admin_players_path
    else
      render :new
    end
  end

   def show; end

   def edit; end

   def update
    if @player.update player_params
      flash[:success] =  t "success"
      redirect_to admin_players_path
    else
      render :edit
    end
  end

   def destroy
    if @player.destroy
      flash[:success] = t "success"
    else
      flash[:danger] = t "error"
    end
    redirect_to admin_players_path
  end
  
  private

   def player_params
    params.require(:player).permit Player::PLAYER_PARAMS
  end

   def load_player
    @player = Player.find_by id: params[:id]

    return if @player
    flash[:danger] = t "error"
    redirect_to root_path
  end
end

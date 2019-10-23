class Admin::RoundsController < AdminController
  before_action :load_round, except: %i(new create index)

  def index
    @rounds = Round.page(params[:page]).per Settings.paging_table
  end

  def new
    @round = Round.new
  end

  def create
    @round = Round.new round_params

    if @round.save
      flash[:success] = t("success")
      redirect_to admin_rounds_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @round.update round_params
      flash[:success] =  t "success"
      redirect_to admin_rounds_path
    else
      render :edit
    end
  end

  def destroy
    if @round.destroy
      flash[:success] = t "success"
    else
      flash[:danger] = t "error"
    end
    redirect_to admin_rounds_path
  end

  private
  
  def round_params
    params.require(:round).permit Round::ROUND_PARAMS
  end

  def load_round
    @round = Round.find_by id: params[:id]

    return if @round
    flash[:danger] = t "error"
    redirect_to root_path
  end
end

class Admin::NewspapersController < AdminController
  before_action :load_newspaper, except: %i(new create index)

  def index
    @newspapers = Newspaper.page(params[:page]).per Settings.paging_table
  end

  def new
    @newspaper = Newspaper.new
  end

  def create
    @newspaper = Newspaper.new newspaper_params

    if @newspaper.save
      flash[:success] = t("success")
      redirect_to admin_newspapers_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @newspaper.update newspaper_params
      flash[:success] =  t "success"
      redirect_to admin_newspapers_path
    else
      render :edit
    end
  end

  def destroy
    if @newspaper.destroy
      flash[:success] = t "success"
    else
      flash[:danger] = t "error"
    end
    redirect_to admin_newspapers_path
  end

  private
  
  def newspaper_params
    params.require(:newspaper).permit Newspaper::NEWSPAPER_PARAMS
  end

  def load_newspaper
    @newspaper = Newspaper.find_by id: params[:id]

    return if @newspaper
    flash[:danger] = t "error"
    redirect_to root_path
  end
end

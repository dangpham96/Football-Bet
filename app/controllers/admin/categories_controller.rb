class Admin::CategoriesController < AdminController
  before_action :load_category, except: %i(new create index)

  def index
    @categories = Category.page(params[:page]).per Settings.paging_table
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params

    if @category.save
      flash[:success] = t "success"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @category.update category_params
      flash[:success] =  t "success"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = t "success"
    else
      flash[:danger] = t "error"
    end
    redirect_to admin_categories_path
  end

  private
  
  def category_params
    params.require(:category).permit Category::CATEGORY_PARAMS
  end

  def load_category
    @category = Category.find_by id: params[:id]

    return if @category
    flash[:danger] = t "error"
    redirect_to root_path
  end
end

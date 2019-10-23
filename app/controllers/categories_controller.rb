class CategoriesController < ApplicationController
  def show
    category = Category.find_by id: params[:id]
    @newspapers = category.newspapers.page(params[:page]).per Settings.paging_table_new
  end

  def index; end
end

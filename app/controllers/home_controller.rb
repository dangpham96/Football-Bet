class HomeController < ApplicationController
  include HomeHelper
  def index
    @newspaper_hots = Newspaper.ordered_by_newspaper_id.by_status_hot.take Settings.show_newspaper_home
    @newspaper_normals = Newspaper.by_status_normal.take Settings.show_newspaper_home
    @categories_show = Category.by_status_show.take Settings.show_newspaper_home
    @newspapers_show = get_new_of_category @categories_show.map &:id
  end 
end

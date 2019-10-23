module HomeHelper
  def get_new_of_category category_ids
    Newspaper.get_new_by_category_ids category_ids
  end

  def get_newspaper_home_page category
    category.newspapers.limit_show_newspapers
  end
end

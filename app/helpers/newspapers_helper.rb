module NewspapersHelper
  def get_category
    Category.pluck :name, :id
  end 
end

module Admin::SeasonsHelper
  def get_leagues
    League.pluck :name, :id
  end 
end
